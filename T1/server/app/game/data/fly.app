{application,fly,
             [{description,[]},
              {vsn,"1"},
              {registered,[]},
              {applications,[kernel,stdlib]},
              {mod,{fly,[]}},
              {env,[
                    {interval, 5000},
					{src_dirs,
							[
                                "../src",
								"../../common/src",
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
								"../../deps/gen_rpc",
								"../../deps/db_proxy",
								"../../deps/observer_cli"
                            ]
                    },
					{inc_dirs,
						[
							"../include", 
							"../../deps/gen_rpc/include",
							"../../deps/gen_rpc/include",
							"../../common/include"
						]
					},
					{opts,
						[
							debug_info, nowarn_export_all, bin_opt_info,
							{outdir, "./../ebin"},
							{
								src_dirs, 
								[
									"../../common/src",
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
									"../../deps/gen_rpc",
									"../../deps/db_proxy",
									"../../deps/observer_cli"
								]
							},
							{i, "../include"},
							{i, "../src/config"},
							{i, "../../common/src/netmsg"},
							{i, "../../common/include"},
							{i, "../../deps/pubs/include"},
							{i, "../../deps/gen_rpc/include"},
							{i, "../../deps/mysql-otp/include"}
						]
					}
				]
			},
{modules, [fly,fly_worker]}]}.
