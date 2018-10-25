{application,fastlog,
             [{description,[]},
              {vsn,"1"},
              {registered,[]},
              {applications,[kernel,stdlib]},
              {mod,{fastlog_app,["center"]}},
              {env,[{show_in_stdio,true},{mkdir_restart, false},{createfile_restart, false}]},
              {modules,[fastlog,fastlog_app,fastlog_sup,gen_server2]}]}.
