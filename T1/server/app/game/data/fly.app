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
								"../../deps/recon",
								"../../deps/mysql-otp",
								"../../deps/mysql-otp-poolboy",
								"../../deps/poolboy",
								"../../deps/db_proxy"
                              ]
                    },
					{inc_dirs,[
								"../include", 
								"../src/pub/config", 
								"../src/pub/netmsg", 
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
									"../../deps/recon",
									"../../deps/mysql-otp",
									"../../deps/mysql-otp-poolboy",
									"../../deps/poolboy",
									"../../deps/db_proxy"
                               ]
							},
							{i, "../include"},
							{i, "../src/pub/config"},
							{i, "../src/pub/netmsg"},
							{i, "../../deps/pubs/include"},
							{i, "../../deps/pubs/src/net"},
							{i, "../../deps/pubs/src/resource/pack"},
							{i, "../../deps/mysql-otp/include"}
						]
					}
               ]
              },
              {modules,[fly,fly_worker]}]}.
