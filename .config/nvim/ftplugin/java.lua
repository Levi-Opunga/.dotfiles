local config = {
    cmd = {'/home/login/Documents/nvimStuff/jdtls/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'.gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}

config['init_options'] = {
  bundles = {
    vim.fn.glob("/home/login/Documents/nvimStuff/java-debug-main/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", 1)
  };
}


require('jdtls').start_or_attach(config)
require('jdtls.setup').add_commands()

vim.cmd("command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)")
vim.cmd("command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)")
vim.cmd(" command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()")
vim.cmd("command! -buffer JdtJol lua require('jdtls').jol()")
vim.cmd(" command! -buffer JdtBytecode lua require('jdtls').javap()")
vim.cmd(" command! -buffer JdtJshell lua require('jdtls').jshell()")
