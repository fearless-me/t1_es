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
                                "../../deps/ranch",
								"../../deps/mysql-otp",
								"../../deps/mysql-otp-poolboy",
								"../../deps/poolboy"
                              ]
                    },
					{inc_dirs,[
								"../include", 
								"../src/config", 
								"../../deps/pubs/include", 
								"../../deps/pubs/src/net", 
								"../../deps/pubs/src/resource/pack"]},
					{opts,
						[
							debug_info, nowarn_export_all, bin_opt_info,
							{outdir, "./../ebin"},
							{
								src_dirs, 
								[
									"../src",
									"../../deps/pubs",
									"../../deps/dynamic_compile",
									"../../deps/econfig",
									"../../deps/fastlog",
									"../../deps/fly",
									"../../deps/ranch",
									"../../deps/mysql-otp",
									"../../deps/mysql-otp-poolboy",
									"../../deps/poolboy"								
                               ]
							},
							{i, "../include"},
							{i, "../src/config"},
							{i, "../../deps/pubs/include"},
							{i, "../../deps/pubs/src/net"},
							{i, "../../deps/pubs/src/resource/pack"},
							{i, "../../deps/mysql-otp/include"}
						]
					}
               ]
              },
              {modules,[fly,fly_worker]}]}.
