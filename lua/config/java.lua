-- lua/config/java.lua
local M = {}

M.setup = function(opts)
  local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
  local jdtls_launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
  if jdtls_launcher == "" then
    vim.notify("JDTLS launcher not found. Make sure jdtls is installed via Mason.", vim.log.levels.WARN)
    -- Try to find it via mason.nvim API if available (more robust)
    local mason_registry = require("mason-registry")
    local pkg = mason_registry.get_package("jdtls")
    local path = pkg:get_install_path()
    if path then
      jdtls_launcher = vim.fn.glob(path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
    end
    if jdtls_launcher == "" then
       vim.notify("JDTLS launcher still not found after checking Mason install path.", vim.log.levels.ERROR)
      return
    end
  end

  -- Determine workspace directory: Assumes project root contains .git, or pom.xml, or build.gradle
  -- You might need to adjust this logic for your project structure.
  local root_markers = { ".git", "pom.xml", "build.gradle", "settings.gradle", ".project" }
  local root_dir = require("lspconfig.util").root_pattern(unpack(root_markers))(vim.fn.getcwd()) or vim.fn.expand("%:p:h")

  local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
  extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

  local config = {
    cmd = {
      "java",
      "-Declipse.application=org.eclipse.jdt.ls.core.id1.JavaLanguageServerID",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-Xms1g",
      "--add-modules=ALL-SYSTEM",
      "--add-opens", "java.base/java.util=ALL-UNNAMED",
      "--add-opens", "java.base/java.lang=ALL-UNNAMED",
      "-jar", jdtls_launcher,
      "-configuration", jdtls_path .. "/config_mac", -- or config_linux / config_win
      "-data", vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t"),
    },
    root_dir = root_dir,
    capabilities = opts.capabilities, -- Pass capabilities from mason-lspconfig
    on_attach = function(client, bufnr)
      opts.on_attach(client, bufnr) -- Call the shared on_attach
      require("jdtls.setup").add_commands() -- Add JDTLS specific commands
      -- You can add Java-specific keymaps here if needed, or if they conflict with global ones
    end,
    settings = {
      java = {
        -- Ensure these paths are correct or remove if not needed
        -- eclipse = {
        --   downloadSources = true,
        -- },
        -- configuration = {
        --   updateBuildConfiguration = "interactive",
        -- },
        -- signatureHelp = { enabled = true },
        -- contentProvider = { preferred = "fernflower" },
        -- import = {
        --   gradle = {
        --     enabled = true, -- Ensure gradle integration is enabled if you use gradle
        --   },
        --   maven = {
        --     enabled = true, -- Ensure maven integration is enabled if you use maven
        --   }
        -- },
        format = {
          enabled = true, -- Let jdtls handle formatting if you prefer it over formatter.nvim for Java
          comments = {
            enabled = false, -- As per your original config
          },
          settings = {
            -- URL for formatter style, ensure this is accessible or use a local file
            url = "https://gist.githubusercontent.com/ikws4/7880fdcb4e3bf4a38999a628d287b1ab/raw/9005c451ed1ff629679d6100e22d63acc805e170/jdtls-formatter-style.xml",
            -- profile = "GoogleStyle", -- Or specify a profile name
          },
        },
        -- Example:
        -- completion = {
        --   favoriteStaticMembers = {
        --     "org.assertj.core.api.Assertions.*"
        --   },
        --   importOrder = {"java", "javax", "org", "com"}
        -- },
      },
    },
    init_options = {
      bundles = {},
      extendedClientCapabilities = extendedClientCapabilities,
    },
  }

  -- This will start or attach the JDTLS server.
  -- It's important that this is called after Mason ensures jdtls is installed.
  require("jdtls").start_or_attach(config)
end

return M
