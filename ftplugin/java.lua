vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.ts = 4
vim.opt_local.expandtab = true

local jdtls_dir = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local config_dir = jdtls_dir .. "/config_linux"
local plugins_dir = jdtls_dir .. "/plugins/"
local path_to_jar = plugins_dir .. "org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"
local path_to_java_dap = "/home/joalvarez/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/"

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)

if root_dir == "" then
  return
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name
os.execute("mkdir " .. workspace_dir)

local config = {

  cmd = {
    "/usr/lib/jvm/java-17-openjdk/bin/java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",

    "-jar", path_to_jar,
    "-configuration", config_dir,
    "-data", workspace_dir
  },
  root_dir = root_dir,

  settings = {
    java = {
      home = "/usr/lib/jvm/java-11-openjdk/",
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
          {
            name = "JavaSE-11",
            path = "/usr/lib/jvm/java-11-openjdk/",
          },
          {
            name = "JavaSE-17",
            path = "/usr/lib/jvm/java-17-openjdk/"
          }
        },
        maven = {
          downloadSources = true,
        },
        implementationCodeLens = {
          enabled = true,
        },
        referencesCodeLens = {
          enabled = true,
        },
        references = {
          includeDecompiledSources = true,
        },
        format = {
          enabled = true,
          -- settings = {
            
          -- }
        },
      },

      signatureHelp = { enabled = true },

      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
        importOrder = {
          "java",
          "javax",
          "com",
          "org"
        },
      },

      sources = {
        organizeImports = {
          startThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        useBlocks = true,
      },
      
      flags = {
        allow_incremental_sync = true,
      },

      init_options = {
        bundles = {
           vim.fn.glob(path_to_java_dap .. "com.microsoft.java.debug.plugin-*.jar", 1)
        },
      },
    }
  }
}

function map_java_keys(bufnr)
    map_ls_keys()

    local spring_boot_run = "mvn spring-boot:run -Dspring-boot.run.profiles=local"
    local command = ':lua require("toggleterm").exec("' .. spring_boot_run .. '")<CR>'
    vim.api.nvim_set_keymap("n", "<leader>sr", command, {noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>oi", ":lua require('jdtls').organize_imports()")

    require"lsp_signature".on_attach({
        bind = true,
        padding = "",
        handler_opts = {
            border = "rounded"
        }
    }, bufnr)
    require("jdtls").setup_dap({ hotcodereplace = "auto" })
end
config["on_attach"] = function(client, bufnr)
  -- map_java_keys(bufnr)
    
    local _, _ = pcall(vim.lsp.codelens.refresh)
	require("jdtls.dap").setup_dap_main_class_configs()
	require("jdtls").setup_dap({ hotcodereplace = "auto" })
	require("user.lsp.handlers").on_attach(client, bufnr)
end

require("jdtls").start_or_attach(config)
