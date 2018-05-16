%% coding: latin-1
%%: 实现
-module(cfg_lottery_store_cht).
-compile(export_all).
-include("cfg_lottery_store.hrl").
-include("logger.hrl").

getRow(1)->
    #lottery_storeCfg {
    id = 1,
    storeID = 1,
    startTime = [2016,09,01],
    endTime = [2020,09,01],
    week = 0,
    itemID = 1811,
    itemNumber = 1,
    isBind = 0,
    weight = 1000,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(2)->
    #lottery_storeCfg {
    id = 2,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1812,
    itemNumber = 1,
    isBind = 0,
    weight = 1000,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(3)->
    #lottery_storeCfg {
    id = 3,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1813,
    itemNumber = 1,
    isBind = 0,
    weight = 1000,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(4)->
    #lottery_storeCfg {
    id = 4,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1814,
    itemNumber = 1,
    isBind = 0,
    weight = 1000,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(5)->
    #lottery_storeCfg {
    id = 5,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1821,
    itemNumber = 1,
    isBind = 0,
    weight = 670,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(6)->
    #lottery_storeCfg {
    id = 6,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1822,
    itemNumber = 1,
    isBind = 0,
    weight = 670,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(7)->
    #lottery_storeCfg {
    id = 7,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1823,
    itemNumber = 1,
    isBind = 0,
    weight = 670,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(8)->
    #lottery_storeCfg {
    id = 8,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1824,
    itemNumber = 1,
    isBind = 0,
    weight = 670,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(9)->
    #lottery_storeCfg {
    id = 9,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1825,
    itemNumber = 1,
    isBind = 0,
    weight = 670,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(10)->
    #lottery_storeCfg {
    id = 10,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1826,
    itemNumber = 1,
    isBind = 0,
    weight = 670,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(11)->
    #lottery_storeCfg {
    id = 11,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1827,
    itemNumber = 1,
    isBind = 0,
    weight = 670,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(12)->
    #lottery_storeCfg {
    id = 12,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1829,
    itemNumber = 1,
    isBind = 0,
    weight = 670,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(13)->
    #lottery_storeCfg {
    id = 13,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1831,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(14)->
    #lottery_storeCfg {
    id = 14,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1833,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(15)->
    #lottery_storeCfg {
    id = 15,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1835,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(16)->
    #lottery_storeCfg {
    id = 16,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1836,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(17)->
    #lottery_storeCfg {
    id = 17,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1837,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(18)->
    #lottery_storeCfg {
    id = 18,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1838,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(19)->
    #lottery_storeCfg {
    id = 19,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1868,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(20)->
    #lottery_storeCfg {
    id = 20,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1863,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(21)->
    #lottery_storeCfg {
    id = 21,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1841,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(22)->
    #lottery_storeCfg {
    id = 22,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1843,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(23)->
    #lottery_storeCfg {
    id = 23,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1845,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(24)->
    #lottery_storeCfg {
    id = 24,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1846,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(25)->
    #lottery_storeCfg {
    id = 25,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1848,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(26)->
    #lottery_storeCfg {
    id = 26,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1857,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(27)->
    #lottery_storeCfg {
    id = 27,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1858,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(28)->
    #lottery_storeCfg {
    id = 28,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1865,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(29)->
    #lottery_storeCfg {
    id = 29,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1866,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(30)->
    #lottery_storeCfg {
    id = 30,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1844,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(31)->
    #lottery_storeCfg {
    id = 31,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1847,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(32)->
    #lottery_storeCfg {
    id = 32,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1851,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(33)->
    #lottery_storeCfg {
    id = 33,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1852,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(34)->
    #lottery_storeCfg {
    id = 34,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1853,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(35)->
    #lottery_storeCfg {
    id = 35,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1856,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(36)->
    #lottery_storeCfg {
    id = 36,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1860,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(37)->
    #lottery_storeCfg {
    id = 37,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1862,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(38)->
    #lottery_storeCfg {
    id = 38,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1864,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(39)->
    #lottery_storeCfg {
    id = 39,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1911,
    itemNumber = 10,
    isBind = 0,
    weight = 1500,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(40)->
    #lottery_storeCfg {
    id = 40,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1912,
    itemNumber = 10,
    isBind = 0,
    weight = 1500,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(41)->
    #lottery_storeCfg {
    id = 41,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1913,
    itemNumber = 10,
    isBind = 0,
    weight = 1500,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(42)->
    #lottery_storeCfg {
    id = 42,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1914,
    itemNumber = 10,
    isBind = 0,
    weight = 1500,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(43)->
    #lottery_storeCfg {
    id = 43,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1921,
    itemNumber = 10,
    isBind = 0,
    weight = 1330,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(44)->
    #lottery_storeCfg {
    id = 44,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1922,
    itemNumber = 10,
    isBind = 0,
    weight = 1330,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(45)->
    #lottery_storeCfg {
    id = 45,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1923,
    itemNumber = 10,
    isBind = 0,
    weight = 1330,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(46)->
    #lottery_storeCfg {
    id = 46,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1924,
    itemNumber = 10,
    isBind = 0,
    weight = 1330,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(47)->
    #lottery_storeCfg {
    id = 47,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1925,
    itemNumber = 10,
    isBind = 0,
    weight = 1330,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(48)->
    #lottery_storeCfg {
    id = 48,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1926,
    itemNumber = 10,
    isBind = 0,
    weight = 1330,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(49)->
    #lottery_storeCfg {
    id = 49,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1927,
    itemNumber = 10,
    isBind = 0,
    weight = 1330,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(50)->
    #lottery_storeCfg {
    id = 50,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1928,
    itemNumber = 10,
    isBind = 0,
    weight = 1330,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(51)->
    #lottery_storeCfg {
    id = 51,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1931,
    itemNumber = 10,
    isBind = 0,
    weight = 1000,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(52)->
    #lottery_storeCfg {
    id = 52,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1933,
    itemNumber = 10,
    isBind = 0,
    weight = 1000,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(53)->
    #lottery_storeCfg {
    id = 53,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1935,
    itemNumber = 10,
    isBind = 0,
    weight = 1000,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(54)->
    #lottery_storeCfg {
    id = 54,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1936,
    itemNumber = 10,
    isBind = 0,
    weight = 1000,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(55)->
    #lottery_storeCfg {
    id = 55,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1937,
    itemNumber = 10,
    isBind = 0,
    weight = 1000,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(56)->
    #lottery_storeCfg {
    id = 56,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1938,
    itemNumber = 10,
    isBind = 0,
    weight = 1000,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(57)->
    #lottery_storeCfg {
    id = 57,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1968,
    itemNumber = 10,
    isBind = 0,
    weight = 1000,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(58)->
    #lottery_storeCfg {
    id = 58,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1963,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(59)->
    #lottery_storeCfg {
    id = 59,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1941,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(60)->
    #lottery_storeCfg {
    id = 60,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1943,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(61)->
    #lottery_storeCfg {
    id = 61,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1945,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(62)->
    #lottery_storeCfg {
    id = 62,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1946,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(63)->
    #lottery_storeCfg {
    id = 63,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1948,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(64)->
    #lottery_storeCfg {
    id = 64,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1957,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(65)->
    #lottery_storeCfg {
    id = 65,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1958,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(66)->
    #lottery_storeCfg {
    id = 66,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1965,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(67)->
    #lottery_storeCfg {
    id = 67,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1966,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(68)->
    #lottery_storeCfg {
    id = 68,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1944,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(69)->
    #lottery_storeCfg {
    id = 69,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1947,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(70)->
    #lottery_storeCfg {
    id = 70,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1951,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(71)->
    #lottery_storeCfg {
    id = 71,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1952,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(72)->
    #lottery_storeCfg {
    id = 72,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1953,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(73)->
    #lottery_storeCfg {
    id = 73,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1956,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(74)->
    #lottery_storeCfg {
    id = 74,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1960,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(75)->
    #lottery_storeCfg {
    id = 75,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1962,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(76)->
    #lottery_storeCfg {
    id = 76,
    storeID = 1,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1964,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(77)->
    #lottery_storeCfg {
    id = 77,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1811,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(78)->
    #lottery_storeCfg {
    id = 78,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1812,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(79)->
    #lottery_storeCfg {
    id = 79,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1813,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(80)->
    #lottery_storeCfg {
    id = 80,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1814,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(81)->
    #lottery_storeCfg {
    id = 81,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1821,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(82)->
    #lottery_storeCfg {
    id = 82,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1822,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(83)->
    #lottery_storeCfg {
    id = 83,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1823,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(84)->
    #lottery_storeCfg {
    id = 84,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1824,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(85)->
    #lottery_storeCfg {
    id = 85,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1825,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(86)->
    #lottery_storeCfg {
    id = 86,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1826,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(87)->
    #lottery_storeCfg {
    id = 87,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1827,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(88)->
    #lottery_storeCfg {
    id = 88,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1829,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(89)->
    #lottery_storeCfg {
    id = 89,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1831,
    itemNumber = 1,
    isBind = 0,
    weight = 330,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(90)->
    #lottery_storeCfg {
    id = 90,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1833,
    itemNumber = 1,
    isBind = 0,
    weight = 330,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(91)->
    #lottery_storeCfg {
    id = 91,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1835,
    itemNumber = 1,
    isBind = 0,
    weight = 330,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(92)->
    #lottery_storeCfg {
    id = 92,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1836,
    itemNumber = 1,
    isBind = 0,
    weight = 330,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(93)->
    #lottery_storeCfg {
    id = 93,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1837,
    itemNumber = 1,
    isBind = 0,
    weight = 330,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(94)->
    #lottery_storeCfg {
    id = 94,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1838,
    itemNumber = 1,
    isBind = 0,
    weight = 330,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(95)->
    #lottery_storeCfg {
    id = 95,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1868,
    itemNumber = 1,
    isBind = 0,
    weight = 330,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(96)->
    #lottery_storeCfg {
    id = 96,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1863,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(97)->
    #lottery_storeCfg {
    id = 97,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1841,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(98)->
    #lottery_storeCfg {
    id = 98,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1843,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(99)->
    #lottery_storeCfg {
    id = 99,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1845,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(100)->
    #lottery_storeCfg {
    id = 100,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1846,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(101)->
    #lottery_storeCfg {
    id = 101,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1848,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(102)->
    #lottery_storeCfg {
    id = 102,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1857,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(103)->
    #lottery_storeCfg {
    id = 103,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1858,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(104)->
    #lottery_storeCfg {
    id = 104,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1865,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(105)->
    #lottery_storeCfg {
    id = 105,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1866,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(106)->
    #lottery_storeCfg {
    id = 106,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1844,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(107)->
    #lottery_storeCfg {
    id = 107,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1847,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(108)->
    #lottery_storeCfg {
    id = 108,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1851,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(109)->
    #lottery_storeCfg {
    id = 109,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1852,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(110)->
    #lottery_storeCfg {
    id = 110,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1853,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(111)->
    #lottery_storeCfg {
    id = 111,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1856,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(112)->
    #lottery_storeCfg {
    id = 112,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1860,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(113)->
    #lottery_storeCfg {
    id = 113,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1862,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(114)->
    #lottery_storeCfg {
    id = 114,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1864,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(115)->
    #lottery_storeCfg {
    id = 115,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1911,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(116)->
    #lottery_storeCfg {
    id = 116,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1912,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(117)->
    #lottery_storeCfg {
    id = 117,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1913,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(118)->
    #lottery_storeCfg {
    id = 118,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1914,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(119)->
    #lottery_storeCfg {
    id = 119,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1921,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(120)->
    #lottery_storeCfg {
    id = 120,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1922,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(121)->
    #lottery_storeCfg {
    id = 121,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1923,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(122)->
    #lottery_storeCfg {
    id = 122,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1924,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(123)->
    #lottery_storeCfg {
    id = 123,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1925,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(124)->
    #lottery_storeCfg {
    id = 124,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1926,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(125)->
    #lottery_storeCfg {
    id = 125,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1927,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(126)->
    #lottery_storeCfg {
    id = 126,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1928,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(127)->
    #lottery_storeCfg {
    id = 127,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1931,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(128)->
    #lottery_storeCfg {
    id = 128,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1933,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(129)->
    #lottery_storeCfg {
    id = 129,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1935,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(130)->
    #lottery_storeCfg {
    id = 130,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1936,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(131)->
    #lottery_storeCfg {
    id = 131,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1937,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(132)->
    #lottery_storeCfg {
    id = 132,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1938,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(133)->
    #lottery_storeCfg {
    id = 133,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1968,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(134)->
    #lottery_storeCfg {
    id = 134,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1963,
    itemNumber = 5,
    isBind = 0,
    weight = 200,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(135)->
    #lottery_storeCfg {
    id = 135,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1941,
    itemNumber = 5,
    isBind = 0,
    weight = 200,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(136)->
    #lottery_storeCfg {
    id = 136,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1943,
    itemNumber = 5,
    isBind = 0,
    weight = 200,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(137)->
    #lottery_storeCfg {
    id = 137,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1945,
    itemNumber = 5,
    isBind = 0,
    weight = 200,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(138)->
    #lottery_storeCfg {
    id = 138,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1946,
    itemNumber = 5,
    isBind = 0,
    weight = 200,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(139)->
    #lottery_storeCfg {
    id = 139,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1948,
    itemNumber = 5,
    isBind = 0,
    weight = 200,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(140)->
    #lottery_storeCfg {
    id = 140,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1957,
    itemNumber = 5,
    isBind = 0,
    weight = 200,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(141)->
    #lottery_storeCfg {
    id = 141,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1958,
    itemNumber = 5,
    isBind = 0,
    weight = 200,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(142)->
    #lottery_storeCfg {
    id = 142,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1965,
    itemNumber = 5,
    isBind = 0,
    weight = 200,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(143)->
    #lottery_storeCfg {
    id = 143,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1966,
    itemNumber = 5,
    isBind = 0,
    weight = 200,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(144)->
    #lottery_storeCfg {
    id = 144,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1969,
    itemNumber = 5,
    isBind = 0,
    weight = 200,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(145)->
    #lottery_storeCfg {
    id = 145,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1944,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(146)->
    #lottery_storeCfg {
    id = 146,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1947,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(147)->
    #lottery_storeCfg {
    id = 147,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1951,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(148)->
    #lottery_storeCfg {
    id = 148,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1952,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(149)->
    #lottery_storeCfg {
    id = 149,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1953,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(150)->
    #lottery_storeCfg {
    id = 150,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1956,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(151)->
    #lottery_storeCfg {
    id = 151,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1960,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(152)->
    #lottery_storeCfg {
    id = 152,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1962,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(153)->
    #lottery_storeCfg {
    id = 153,
    storeID = 2,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1964,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(154)->
    #lottery_storeCfg {
    id = 154,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1811,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(155)->
    #lottery_storeCfg {
    id = 155,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1812,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(156)->
    #lottery_storeCfg {
    id = 156,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1813,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(157)->
    #lottery_storeCfg {
    id = 157,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1814,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(158)->
    #lottery_storeCfg {
    id = 158,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1821,
    itemNumber = 1,
    isBind = 0,
    weight = 670,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(159)->
    #lottery_storeCfg {
    id = 159,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1822,
    itemNumber = 1,
    isBind = 0,
    weight = 670,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(160)->
    #lottery_storeCfg {
    id = 160,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1823,
    itemNumber = 1,
    isBind = 0,
    weight = 670,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(161)->
    #lottery_storeCfg {
    id = 161,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1824,
    itemNumber = 1,
    isBind = 0,
    weight = 670,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(162)->
    #lottery_storeCfg {
    id = 162,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1825,
    itemNumber = 1,
    isBind = 0,
    weight = 670,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(163)->
    #lottery_storeCfg {
    id = 163,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1826,
    itemNumber = 1,
    isBind = 0,
    weight = 670,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(164)->
    #lottery_storeCfg {
    id = 164,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1827,
    itemNumber = 1,
    isBind = 0,
    weight = 670,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(165)->
    #lottery_storeCfg {
    id = 165,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1829,
    itemNumber = 1,
    isBind = 0,
    weight = 670,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(166)->
    #lottery_storeCfg {
    id = 166,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1831,
    itemNumber = 1,
    isBind = 0,
    weight = 330,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(167)->
    #lottery_storeCfg {
    id = 167,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1833,
    itemNumber = 1,
    isBind = 0,
    weight = 330,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(168)->
    #lottery_storeCfg {
    id = 168,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1835,
    itemNumber = 1,
    isBind = 0,
    weight = 330,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(169)->
    #lottery_storeCfg {
    id = 169,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1836,
    itemNumber = 1,
    isBind = 0,
    weight = 330,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(170)->
    #lottery_storeCfg {
    id = 170,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1837,
    itemNumber = 1,
    isBind = 0,
    weight = 330,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(171)->
    #lottery_storeCfg {
    id = 171,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1838,
    itemNumber = 1,
    isBind = 0,
    weight = 330,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(172)->
    #lottery_storeCfg {
    id = 172,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1868,
    itemNumber = 1,
    isBind = 0,
    weight = 330,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(173)->
    #lottery_storeCfg {
    id = 173,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1863,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(174)->
    #lottery_storeCfg {
    id = 174,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1841,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(175)->
    #lottery_storeCfg {
    id = 175,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1843,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(176)->
    #lottery_storeCfg {
    id = 176,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1845,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(177)->
    #lottery_storeCfg {
    id = 177,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1846,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(178)->
    #lottery_storeCfg {
    id = 178,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1848,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(179)->
    #lottery_storeCfg {
    id = 179,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1857,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(180)->
    #lottery_storeCfg {
    id = 180,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1858,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(181)->
    #lottery_storeCfg {
    id = 181,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1865,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(182)->
    #lottery_storeCfg {
    id = 182,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1866,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(183)->
    #lottery_storeCfg {
    id = 183,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1844,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(184)->
    #lottery_storeCfg {
    id = 184,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1847,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(185)->
    #lottery_storeCfg {
    id = 185,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1851,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(186)->
    #lottery_storeCfg {
    id = 186,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1852,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(187)->
    #lottery_storeCfg {
    id = 187,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1853,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(188)->
    #lottery_storeCfg {
    id = 188,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1856,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(189)->
    #lottery_storeCfg {
    id = 189,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1860,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(190)->
    #lottery_storeCfg {
    id = 190,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1862,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(191)->
    #lottery_storeCfg {
    id = 191,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1864,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(192)->
    #lottery_storeCfg {
    id = 192,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1911,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(193)->
    #lottery_storeCfg {
    id = 193,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1912,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(194)->
    #lottery_storeCfg {
    id = 194,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1913,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(195)->
    #lottery_storeCfg {
    id = 195,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1914,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(196)->
    #lottery_storeCfg {
    id = 196,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1921,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(197)->
    #lottery_storeCfg {
    id = 197,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1922,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(198)->
    #lottery_storeCfg {
    id = 198,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1923,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(199)->
    #lottery_storeCfg {
    id = 199,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1924,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(200)->
    #lottery_storeCfg {
    id = 200,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1925,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(201)->
    #lottery_storeCfg {
    id = 201,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1926,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(202)->
    #lottery_storeCfg {
    id = 202,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1927,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(203)->
    #lottery_storeCfg {
    id = 203,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1928,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(204)->
    #lottery_storeCfg {
    id = 204,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1931,
    itemNumber = 10,
    isBind = 0,
    weight = 1000,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(205)->
    #lottery_storeCfg {
    id = 205,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1933,
    itemNumber = 10,
    isBind = 0,
    weight = 1000,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(206)->
    #lottery_storeCfg {
    id = 206,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1935,
    itemNumber = 10,
    isBind = 0,
    weight = 1000,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(207)->
    #lottery_storeCfg {
    id = 207,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1936,
    itemNumber = 10,
    isBind = 0,
    weight = 1000,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(208)->
    #lottery_storeCfg {
    id = 208,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1937,
    itemNumber = 10,
    isBind = 0,
    weight = 1000,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(209)->
    #lottery_storeCfg {
    id = 209,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1938,
    itemNumber = 10,
    isBind = 0,
    weight = 1000,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(210)->
    #lottery_storeCfg {
    id = 210,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1968,
    itemNumber = 10,
    isBind = 0,
    weight = 1000,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(211)->
    #lottery_storeCfg {
    id = 211,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1963,
    itemNumber = 5,
    isBind = 0,
    weight = 200,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(212)->
    #lottery_storeCfg {
    id = 212,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1941,
    itemNumber = 5,
    isBind = 0,
    weight = 200,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(213)->
    #lottery_storeCfg {
    id = 213,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1943,
    itemNumber = 5,
    isBind = 0,
    weight = 200,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(214)->
    #lottery_storeCfg {
    id = 214,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1945,
    itemNumber = 5,
    isBind = 0,
    weight = 200,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(215)->
    #lottery_storeCfg {
    id = 215,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1946,
    itemNumber = 5,
    isBind = 0,
    weight = 200,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(216)->
    #lottery_storeCfg {
    id = 216,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1948,
    itemNumber = 5,
    isBind = 0,
    weight = 200,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(217)->
    #lottery_storeCfg {
    id = 217,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1957,
    itemNumber = 5,
    isBind = 0,
    weight = 200,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(218)->
    #lottery_storeCfg {
    id = 218,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1958,
    itemNumber = 5,
    isBind = 0,
    weight = 200,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(219)->
    #lottery_storeCfg {
    id = 219,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1965,
    itemNumber = 5,
    isBind = 0,
    weight = 200,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(220)->
    #lottery_storeCfg {
    id = 220,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1966,
    itemNumber = 5,
    isBind = 0,
    weight = 200,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(221)->
    #lottery_storeCfg {
    id = 221,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1969,
    itemNumber = 5,
    isBind = 0,
    weight = 200,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(222)->
    #lottery_storeCfg {
    id = 222,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1944,
    itemNumber = 5,
    isBind = 0,
    weight = 100,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(223)->
    #lottery_storeCfg {
    id = 223,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1947,
    itemNumber = 5,
    isBind = 0,
    weight = 100,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(224)->
    #lottery_storeCfg {
    id = 224,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1951,
    itemNumber = 5,
    isBind = 0,
    weight = 100,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(225)->
    #lottery_storeCfg {
    id = 225,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1952,
    itemNumber = 5,
    isBind = 0,
    weight = 100,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(226)->
    #lottery_storeCfg {
    id = 226,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1953,
    itemNumber = 5,
    isBind = 0,
    weight = 100,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(227)->
    #lottery_storeCfg {
    id = 227,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1956,
    itemNumber = 5,
    isBind = 0,
    weight = 100,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(228)->
    #lottery_storeCfg {
    id = 228,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1960,
    itemNumber = 5,
    isBind = 0,
    weight = 100,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(229)->
    #lottery_storeCfg {
    id = 229,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1962,
    itemNumber = 5,
    isBind = 0,
    weight = 100,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(230)->
    #lottery_storeCfg {
    id = 230,
    storeID = 3,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1964,
    itemNumber = 5,
    isBind = 0,
    weight = 100,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(231)->
    #lottery_storeCfg {
    id = 231,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1811,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(232)->
    #lottery_storeCfg {
    id = 232,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1812,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(233)->
    #lottery_storeCfg {
    id = 233,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1813,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(234)->
    #lottery_storeCfg {
    id = 234,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1814,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(235)->
    #lottery_storeCfg {
    id = 235,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1821,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(236)->
    #lottery_storeCfg {
    id = 236,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1822,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(237)->
    #lottery_storeCfg {
    id = 237,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1823,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(238)->
    #lottery_storeCfg {
    id = 238,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1824,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(239)->
    #lottery_storeCfg {
    id = 239,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1825,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(240)->
    #lottery_storeCfg {
    id = 240,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1826,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(241)->
    #lottery_storeCfg {
    id = 241,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1827,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(242)->
    #lottery_storeCfg {
    id = 242,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1829,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(243)->
    #lottery_storeCfg {
    id = 243,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1831,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(244)->
    #lottery_storeCfg {
    id = 244,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1833,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(245)->
    #lottery_storeCfg {
    id = 245,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1835,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(246)->
    #lottery_storeCfg {
    id = 246,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1836,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(247)->
    #lottery_storeCfg {
    id = 247,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1837,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(248)->
    #lottery_storeCfg {
    id = 248,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1838,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 0
    };
getRow(249)->
    #lottery_storeCfg {
    id = 249,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1868,
    itemNumber = 1,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(250)->
    #lottery_storeCfg {
    id = 250,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1863,
    itemNumber = 1,
    isBind = 0,
    weight = 110,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(251)->
    #lottery_storeCfg {
    id = 251,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1841,
    itemNumber = 1,
    isBind = 0,
    weight = 55,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(252)->
    #lottery_storeCfg {
    id = 252,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1843,
    itemNumber = 1,
    isBind = 0,
    weight = 55,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(253)->
    #lottery_storeCfg {
    id = 253,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1845,
    itemNumber = 1,
    isBind = 0,
    weight = 55,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(254)->
    #lottery_storeCfg {
    id = 254,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1846,
    itemNumber = 1,
    isBind = 0,
    weight = 55,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(255)->
    #lottery_storeCfg {
    id = 255,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1848,
    itemNumber = 1,
    isBind = 0,
    weight = 55,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(256)->
    #lottery_storeCfg {
    id = 256,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1857,
    itemNumber = 1,
    isBind = 0,
    weight = 55,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(257)->
    #lottery_storeCfg {
    id = 257,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1858,
    itemNumber = 1,
    isBind = 0,
    weight = 55,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(258)->
    #lottery_storeCfg {
    id = 258,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1865,
    itemNumber = 1,
    isBind = 0,
    weight = 55,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(259)->
    #lottery_storeCfg {
    id = 259,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1866,
    itemNumber = 1,
    isBind = 0,
    weight = 55,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(260)->
    #lottery_storeCfg {
    id = 260,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1869,
    itemNumber = 1,
    isBind = 0,
    weight = 55,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(261)->
    #lottery_storeCfg {
    id = 261,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1844,
    itemNumber = 1,
    isBind = 0,
    weight = 20,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(262)->
    #lottery_storeCfg {
    id = 262,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1847,
    itemNumber = 1,
    isBind = 0,
    weight = 20,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(263)->
    #lottery_storeCfg {
    id = 263,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1851,
    itemNumber = 1,
    isBind = 0,
    weight = 20,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(264)->
    #lottery_storeCfg {
    id = 264,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1852,
    itemNumber = 1,
    isBind = 0,
    weight = 20,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(265)->
    #lottery_storeCfg {
    id = 265,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1853,
    itemNumber = 1,
    isBind = 0,
    weight = 20,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(266)->
    #lottery_storeCfg {
    id = 266,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1856,
    itemNumber = 1,
    isBind = 0,
    weight = 20,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(267)->
    #lottery_storeCfg {
    id = 267,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1860,
    itemNumber = 1,
    isBind = 0,
    weight = 20,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(268)->
    #lottery_storeCfg {
    id = 268,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1862,
    itemNumber = 1,
    isBind = 0,
    weight = 20,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(269)->
    #lottery_storeCfg {
    id = 269,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1864,
    itemNumber = 1,
    isBind = 0,
    weight = 20,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(270)->
    #lottery_storeCfg {
    id = 270,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1911,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(271)->
    #lottery_storeCfg {
    id = 271,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1912,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(272)->
    #lottery_storeCfg {
    id = 272,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1913,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(273)->
    #lottery_storeCfg {
    id = 273,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1914,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(274)->
    #lottery_storeCfg {
    id = 274,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1921,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(275)->
    #lottery_storeCfg {
    id = 275,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1922,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(276)->
    #lottery_storeCfg {
    id = 276,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1923,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(277)->
    #lottery_storeCfg {
    id = 277,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1924,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(278)->
    #lottery_storeCfg {
    id = 278,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1925,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(279)->
    #lottery_storeCfg {
    id = 279,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1926,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(280)->
    #lottery_storeCfg {
    id = 280,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1927,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(281)->
    #lottery_storeCfg {
    id = 281,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1928,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(282)->
    #lottery_storeCfg {
    id = 282,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1931,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(283)->
    #lottery_storeCfg {
    id = 283,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1933,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(284)->
    #lottery_storeCfg {
    id = 284,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1935,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(285)->
    #lottery_storeCfg {
    id = 285,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1936,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(286)->
    #lottery_storeCfg {
    id = 286,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1937,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(287)->
    #lottery_storeCfg {
    id = 287,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1938,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(288)->
    #lottery_storeCfg {
    id = 288,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1968,
    itemNumber = 10,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(289)->
    #lottery_storeCfg {
    id = 289,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1963,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(290)->
    #lottery_storeCfg {
    id = 290,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1941,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(291)->
    #lottery_storeCfg {
    id = 291,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1943,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(292)->
    #lottery_storeCfg {
    id = 292,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1945,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(293)->
    #lottery_storeCfg {
    id = 293,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1946,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(294)->
    #lottery_storeCfg {
    id = 294,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1948,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(295)->
    #lottery_storeCfg {
    id = 295,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1957,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(296)->
    #lottery_storeCfg {
    id = 296,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1958,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(297)->
    #lottery_storeCfg {
    id = 297,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1965,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(298)->
    #lottery_storeCfg {
    id = 298,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1966,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(299)->
    #lottery_storeCfg {
    id = 299,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1944,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(300)->
    #lottery_storeCfg {
    id = 300,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1947,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(301)->
    #lottery_storeCfg {
    id = 301,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1951,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(302)->
    #lottery_storeCfg {
    id = 302,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1952,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(303)->
    #lottery_storeCfg {
    id = 303,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1953,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(304)->
    #lottery_storeCfg {
    id = 304,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1956,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(305)->
    #lottery_storeCfg {
    id = 305,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1960,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(306)->
    #lottery_storeCfg {
    id = 306,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1962,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(307)->
    #lottery_storeCfg {
    id = 307,
    storeID = 4,
    startTime = [],
    endTime = [],
    week = 0,
    itemID = 1964,
    itemNumber = 5,
    isBind = 0,
    weight = 0,
    minLevel = 1,
    maxLevel = 105,
    specialty = 1
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {7},
    {8},
    {9},
    {10},
    {11},
    {12},
    {13},
    {14},
    {15},
    {16},
    {17},
    {18},
    {19},
    {20},
    {21},
    {22},
    {23},
    {24},
    {25},
    {26},
    {27},
    {28},
    {29},
    {30},
    {31},
    {32},
    {33},
    {34},
    {35},
    {36},
    {37},
    {38},
    {39},
    {40},
    {41},
    {42},
    {43},
    {44},
    {45},
    {46},
    {47},
    {48},
    {49},
    {50},
    {51},
    {52},
    {53},
    {54},
    {55},
    {56},
    {57},
    {58},
    {59},
    {60},
    {61},
    {62},
    {63},
    {64},
    {65},
    {66},
    {67},
    {68},
    {69},
    {70},
    {71},
    {72},
    {73},
    {74},
    {75},
    {76},
    {77},
    {78},
    {79},
    {80},
    {81},
    {82},
    {83},
    {84},
    {85},
    {86},
    {87},
    {88},
    {89},
    {90},
    {91},
    {92},
    {93},
    {94},
    {95},
    {96},
    {97},
    {98},
    {99},
    {100},
    {101},
    {102},
    {103},
    {104},
    {105},
    {106},
    {107},
    {108},
    {109},
    {110},
    {111},
    {112},
    {113},
    {114},
    {115},
    {116},
    {117},
    {118},
    {119},
    {120},
    {121},
    {122},
    {123},
    {124},
    {125},
    {126},
    {127},
    {128},
    {129},
    {130},
    {131},
    {132},
    {133},
    {134},
    {135},
    {136},
    {137},
    {138},
    {139},
    {140},
    {141},
    {142},
    {143},
    {144},
    {145},
    {146},
    {147},
    {148},
    {149},
    {150},
    {151},
    {152},
    {153},
    {154},
    {155},
    {156},
    {157},
    {158},
    {159},
    {160},
    {161},
    {162},
    {163},
    {164},
    {165},
    {166},
    {167},
    {168},
    {169},
    {170},
    {171},
    {172},
    {173},
    {174},
    {175},
    {176},
    {177},
    {178},
    {179},
    {180},
    {181},
    {182},
    {183},
    {184},
    {185},
    {186},
    {187},
    {188},
    {189},
    {190},
    {191},
    {192},
    {193},
    {194},
    {195},
    {196},
    {197},
    {198},
    {199},
    {200},
    {201},
    {202},
    {203},
    {204},
    {205},
    {206},
    {207},
    {208},
    {209},
    {210},
    {211},
    {212},
    {213},
    {214},
    {215},
    {216},
    {217},
    {218},
    {219},
    {220},
    {221},
    {222},
    {223},
    {224},
    {225},
    {226},
    {227},
    {228},
    {229},
    {230},
    {231},
    {232},
    {233},
    {234},
    {235},
    {236},
    {237},
    {238},
    {239},
    {240},
    {241},
    {242},
    {243},
    {244},
    {245},
    {246},
    {247},
    {248},
    {249},
    {250},
    {251},
    {252},
    {253},
    {254},
    {255},
    {256},
    {257},
    {258},
    {259},
    {260},
    {261},
    {262},
    {263},
    {264},
    {265},
    {266},
    {267},
    {268},
    {269},
    {270},
    {271},
    {272},
    {273},
    {274},
    {275},
    {276},
    {277},
    {278},
    {279},
    {280},
    {281},
    {282},
    {283},
    {284},
    {285},
    {286},
    {287},
    {288},
    {289},
    {290},
    {291},
    {292},
    {293},
    {294},
    {295},
    {296},
    {297},
    {298},
    {299},
    {300},
    {301},
    {302},
    {303},
    {304},
    {305},
    {306},
    {307}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    91,
    92,
    93,
    94,
    95,
    96,
    97,
    98,
    99,
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    118,
    119,
    120,
    121,
    122,
    123,
    124,
    125,
    126,
    127,
    128,
    129,
    130,
    131,
    132,
    133,
    134,
    135,
    136,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    147,
    148,
    149,
    150,
    151,
    152,
    153,
    154,
    155,
    156,
    157,
    158,
    159,
    160,
    161,
    162,
    163,
    164,
    165,
    166,
    167,
    168,
    169,
    170,
    171,
    172,
    173,
    174,
    175,
    176,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    186,
    187,
    188,
    189,
    190,
    191,
    192,
    193,
    194,
    195,
    196,
    197,
    198,
    199,
    200,
    201,
    202,
    203,
    204,
    205,
    206,
    207,
    208,
    209,
    210,
    211,
    212,
    213,
    214,
    215,
    216,
    217,
    218,
    219,
    220,
    221,
    222,
    223,
    224,
    225,
    226,
    227,
    228,
    229,
    230,
    231,
    232,
    233,
    234,
    235,
    236,
    237,
    238,
    239,
    240,
    241,
    242,
    243,
    244,
    245,
    246,
    247,
    248,
    249,
    250,
    251,
    252,
    253,
    254,
    255,
    256,
    257,
    258,
    259,
    260,
    261,
    262,
    263,
    264,
    265,
    266,
    267,
    268,
    269,
    270,
    271,
    272,
    273,
    274,
    275,
    276,
    277,
    278,
    279,
    280,
    281,
    282,
    283,
    284,
    285,
    286,
    287,
    288,
    289,
    290,
    291,
    292,
    293,
    294,
    295,
    296,
    297,
    298,
    299,
    300,
    301,
    302,
    303,
    304,
    305,
    306,
    307
    ].

