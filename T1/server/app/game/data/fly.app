{application,fly,
             [{description,[]},
              {vsn,"1"},
              {registered,[]},
              {applications,[kernel,stdlib]},
              {mod,{fly,[]}},
              {env,[
                    {interval, 5000},
					{src_dirs,[
                                "../src",
                                "../../deps/pubs",
								"../../deps/dynamic_compile",
                                "../../deps/econfig",
                                "../../deps/fastlog",
                                "../../deps/fly",
                                "../../deps/ranch"
                              ]
                    },
					{inc_dirs,[
								"../include", 
								"../../deps/pubs/include", 
								"../../deps/pubs/src/config", 
								"../../deps/pubs/src/net", 
								"../../deps/pubs/src/resource/pack"]},
					{opts,
						[
							debug_info, nowarn_export_all,{outdir, "./../ebin"},
							{src_dirs, [
                                "../src",
                                "../../deps/pubs",
								"../../deps/dynamic_compile",
                                "../../deps/econfig",
                                "../../deps/fastlog",
                                "../../deps/fly",
                                "../../deps/ranch"
                              ]},
							{i, "../include"},
							{i, "../../deps/pubs/include"},
							{i, "../../deps/pubs/src/net"},
							{i, "../../deps/pubs/src/config"},
							{i, "../../deps/pubs/src/resource/pack"},
							{i, "../../deps/mysql-otp/include"}
						]
					}
               ]
              },
              {modules,[fly,fly_worker]}]}.
