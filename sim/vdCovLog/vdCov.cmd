verdiWindowResize -win $_vdCoverage_1 "510" "190" "900" "700"
gui_set_pref_value -category {coveragesetting} -key {geninfodumping} -value 1
gui_exclusion -set_force true
gui_assert_mode -mode flat
gui_class_mode -mode hier
gui_column_config -id   -list  covtblCcexList  -col  C  -show 
gui_column_config -id   -list  covtblCcexList  -col  C  -on   -show 
gui_column_config -id   -list  covtblCcexList  -col  X  -on   -show 
gui_excl_mgr_flat_list -on  0
gui_covdetail_select -id  CovDetail.1   -name   Line
verdiWindowWorkMode -win $_vdCoverage_1 -coverageAnalysis
gui_open_cov  -hier mem_cov1.vdb -testdir {} -test {mem_cov1/test} -merge MergedTest -db_max_tests 10 -fsm transition
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
gui_list_expand -id  CoverageTable.1   -list {covtblFGroupsList} /test_pkg::scoreboard::packet
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { test_pkg::scoreboard::packet.din   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} test_pkg::scoreboard::packet.din  -column {Group} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { test_pkg::scoreboard::packet.din  test_pkg::scoreboard::packet.dout   }
vdCovExit -noprompt
