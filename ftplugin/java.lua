-- vim.opt_local.shiftwidth = 4
-- vim.opt_local.tabstop = 4
-- vim.opt_local.softtabstop = 4
-- vim.opt_local.ts = 4
-- vim.opt_local.expandtab = true

-- local jdtls_dir = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
-- local config_dir = jdtls_dir .. "/config_linux"
-- local plugins_dir = jdtls_dir .. "/plugins/"
-- local path_to_jar = plugins_dir .. "org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"
-- local path_to_java_dap = "/home/joalvarez/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/"

-- local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
-- local root_dir = require("jdtls.setup").find_root(root_markers)

-- if root_dir == "" then
--   return
-- end

-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
-- local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name
-- os.execute("mkdir " .. workspace_dir)

-- local config = {

--   cmd = {
--     "/usr/lib/jvm/java-17-openjdk/bin/java",
--     "-Declipse.application=org.eclipse.jdt.ls.core.id1",
--     "-Dosgi.bundles.defaultStartLevel=4",
--     "-Declipse.product=org.eclipse.jdt.ls.core.product",
--     "-Dlog.protocol=true",
--     "-Dlog.level=ALL",
--     "-Xms1g",
--     "--add-modules=ALL-SYSTEM",
--     "--add-opens", "java.base/java.util=ALL-UNNAMED",
--     "--add-opens", "java.base/java.lang=ALL-UNNAMED",

--     "-jar", path_to_jar,
--     "-configuration", config_dir,
--     "-data", workspace_dir
--   },
--   root_dir = root_dir,

--   settings = {
--     java = {
--       home = "/usr/lib/jvm/java-11-openjdk/",
--       eclipse = {
--         downloadSources = true,
--       },
--       configuration = {
--         updateBuildConfiguration = "interactive",
--         runtimes = {
--           {
--             name = "JavaSE-11",
--             path = "/usr/lib/jvm/java-11-openjdk/",
--           },
--           {
--             name = "JavaSE-17",
--             path = "/usr/lib/jvm/java-17-openjdk/"
--           }
--         },
--         maven = {
--           downloadSources = true,
--         },
--         implementationCodeLens = {
--           enabled = true,
--         },
--         referencesCodeLens = {
--           enabled = true,
--         },
--         references = {
--           includeDecompiledSources = true,
--         },
--         format = {
--           enabled = true,
--           -- settings = {
            
--           -- }
--         },
--       },

--       signatureHelp = { enabled = true },

--       completion = {
--         favoriteStaticMembers = {
--           "org.hamcrest.MatcherAssert.assertThat",
--           "org.hamcrest.Matchers.*",
--           "org.hamcrest.CoreMatchers.*",
--           "org.junit.jupiter.api.Assertions.*",
--           "java.util.Objects.requireNonNull",
--           "java.util.Objects.requireNonNullElse",
--           "org.mockito.Mockito.*",
--         },
--         importOrder = {
--           "java",
--           "javax",
--           "com",
--           "org"
--         },
--       },

--       sources = {
--         organizeImports = {
--           startThreshold = 9999,
--           staticStarThreshold = 9999,
--         },
--       },
--       codeGeneration = {
--         toString = {
--           template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
--         },
--         useBlocks = true,
--       },
      
--       flags = {
--         allow_incremental_sync = true,
--       },

--       init_options = {
--         bundles = {
--            vim.fn.glob(path_to_java_dap .. "com.microsoft.java.debug.plugin-*.jar", 1)
--         },
--       },
--     }
--   }
-- }

-- function map_java_keys(bufnr)
--     map_ls_keys()

--     local spring_boot_run = "mvn spring-boot:run -Dspring-boot.run.profiles=local"
--     local command = ':lua require("toggleterm").exec("' .. spring_boot_run .. '")<CR>'
--     vim.api.nvim_set_keymap("n", "<leader>sr", command, {noremap = true, silent = true })
--     vim.api.nvim_set_keymap("n", "<leader>oi", ":lua require('jdtls').organize_imports()")

--     require"lsp_signature".on_attach({
--         bind = true,
--         padding = "",
--         handler_opts = {
--             border = "rounded"
--         }
--     }, bufnr)
--     require("jdtls").setup_dap({ hotcodereplace = "auto" })
-- end
-- config["on_attach"] = function(client, bufnr)
--   -- map_java_keys(bufnr)
    
--     local _, _ = pcall(vim.lsp.codelens.refresh)
-- 	require("jdtls.dap").setup_dap_main_class_configs()
-- 	require("jdtls").setup_dap({ hotcodereplace = "auto" })
-- 	require("user.lsp.handlers").on_attach(client, bufnr)
-- end

-- require("jdtls").start_or_attach(config)
--

vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.ts = 4
vim.opt_local.expandtab = true

local status, jdtls = pcall(require, "jdtls")
if not status then
	return
end

local function capabilities()
	local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	if status_ok then
		return cmp_nvim_lsp.default_capabilities()
	end

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	}

	return capabilities
end

local function directory_exists(path)
	local f = io.popen("cd " .. path)
	local ff = f:read("*all")

	if ff:find("ItemNotFoundException") then
		return false
	else
		return true
	end
end

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)

-- calculate workspace dir
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name
if directory_exists(workspace_dir) then
else
	os.execute("mkdir " .. workspace_dir)
end
-- get the mason install path
local install_path = require("mason-registry").get_package("jdtls"):get_install_path()

-- get the current OS
local os
if vim.fn.has("macunix") then
	os = "mac"
elseif vim.fn.has("win32") then
	os = "win"
else
	os = "linux"
end

local bundles = {}
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
vim.list_extend(bundles, vim.split(vim.fn.glob(mason_path .. "packages/java-test/extension/server/*.jar"), "\n"))
vim.list_extend(
	bundles,
	vim.split(
		vim.fn.glob(mason_path .. "packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"),
		"\n"
	)
)

local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		--"-javaagent:" .. install_path .. "/lombok.jar",
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-jar",
		vim.fn.glob(install_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
		"-configuration",
		install_path .. "/config_" .. os,
		"-data",
		workspace_dir,
	},
	capabilities = capabilities(),
	root_dir = root_dir,
	settings = {
		java = {},
	},

	init_options = {
		bundles = {
			vim.fn.glob(
				mason_path .. "packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
				"\n"
			),
		},
	},
}

config["on_attach"] = function(client, bufnr)
	local _, _ = pcall(vim.lsp.codelens.refresh)
	require("jdtls.dap").setup_dap_main_class_configs()
	jdtls.setup_dap({ hotcodereplace = "auto" })
	require("user.lsp.handlers").on_attach(client, bufnr)
end

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.java" },
	callback = function()
		local _, _ = pcall(vim.lsp.codelens.refresh)
	end,
})

jdtls.start_or_attach(config)

vim.cmd(
	[[command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)]]
)
