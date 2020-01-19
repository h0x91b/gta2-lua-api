local api = {
	GAME_PAUSED=2,
    GAME_RUN=1,
}
local gta = require("gta")
local ffi = require("ffi")

ffi.cdef[[
typedef unsigned char   undefined;

typedef unsigned int    ImageBaseOffset32;
typedef unsigned char    byte;
typedef unsigned int    dword;

typedef long long    longlong;
typedef unsigned char    uchar;
typedef unsigned int    uint;
typedef unsigned long long    uint16;
typedef unsigned long    ulong;
typedef unsigned long long    ulonglong;
typedef unsigned char    undefined1;
typedef unsigned short    undefined2;
typedef unsigned int    undefined3;
typedef unsigned int    undefined4;
typedef unsigned long long    undefined8;
typedef unsigned short    ushort;

typedef unsigned short    word;
typedef struct Ped Ped, *PPed;

typedef struct Car Car, *PCar;

typedef struct WEAPON_PLAYER_LIST WEAPON_PLAYER_LIST, *PWEAPON_PLAYER_LIST;

typedef struct Sprite Sprite, *PSprite;

typedef struct WEAPON_STRUCT WEAPON_STRUCT, *PWEAPON_STRUCT;

typedef enum PED_BIT_STATE {
    FIRING_FROM_GUN=2048,
    FOLLOW_CAR_TO_GET_IN=65536,
    GETING_IN_OR_OUT_CAR=134217728,
    TOGGLED_ON_WHEN_FIRST_TIME_ATTACK_A_PED=4,
    UNK_1_ALWAYS1=1,
    UNK_2000=8192,
    ZERO_ON_START_GAME_BUT_TOGGLED_ON_FIRST_CAR_ENTER=32768,
    mARMED=128,
    mUNARMED=512
} PED_BIT_STATE;

typedef enum OCUPATION {
    ANY_ELVIS=49,
    ANY_EMERGENCY_SERVICE_MAN=47,
    ANY_GANG_MEMBER=48,
    ANY_LAW_ENFORCEMENT=46,
    ARMYARMY=27,
    BANK_ROBBER=17,
    CARTHIEF=16,
    CRIMINAL=18,
    CRIMINAL_TYPE1=33,
    CRIMINAL_TYPE2=34,
    DRIVER=5,
    DRIVER2=10,
    DRIVER3=50,
    DRONE=41,
    DUMMY=3,
    ELVIS=22,
    ELVIS_LEADER=44,
    EMPTY=1,
    FBI=26,
    FIREMAN=38,
    GUARD=28,
    GUARD_AGAINST_PLAYER=32,
    MUGGER=15,
    NO_OCCUPATION=51,
    PLAYER=0,
    POLICE=24,
    PSYCHO=14,
    REFUGEES=45,
    ROAD_BLOCK_TANK_MAN=39,
    SPECIAL_GROUP_MEMBER=35,
    STAND_STILL_BLOKE=43,
    SWAT=25,
    TANK_DRIVER=36,
    UNKNOWN_OCUPATION13=19,
    UNKNOWN_OCUPATION17=23,
    UNKNOWN_OCUPATION2=2,
    UNKNOWN_OCUPATION4=4,
    UNKNOWN_OCUPATION8=8,
    UNKNOWN_OCUPATION9=9,
    UNK_REL_TO_POLICE1=29,
    UNK_REL_TO_POLICE2=30,
    UNK_REL_TO_POLICE3=31,
    UNK_REL_TO_POLICE4=37
} OCUPATION;

typedef enum PED_STATE {
    DRIVING_A_CAR=10,
    ENTERING_INTO_CAR=3,
    FALL_ON_GROUND=8,
    GETTING_OUT_FROM_CAR=4,
    GOING_TO_CAR=2,
    STAYING=7,
    WALK=0,
    WASTED=9
} PED_STATE;

typedef enum PED_STATE2 {
    DRIVING=10,
    ENTERING_TO_CAR=6,
    FOLLOWING_A_CAR=4,
    GETTING_OUT_FROM_CAR2=7,
    STAYING2=14,
    UNK_16=22,
    UNK_f=15,
    WALKING=0
} PED_STATE2;

typedef enum CAR_LIGHTS_AND_DOORS_BITSTATE {
    BAGAGE_DOORS_OPEN1=2048,
    BAGAGE_DOORS_OPEN2=4096,
    BAGAGE_DOORS_OPEN3=8192,
    BAGAGE_DOORS_OPEN4=16384,
    BAGAGE_DOORS_SET2_OPEN1=268435456,
    BAGAGE_DOORS_SET2_OPEN2=536870912,
    BAGAGE_DOORS_SET2_OPEN3=1073741824,
    BAGAGE_DOORS_SET2_OPEN4=2147483648,
    BRAKES_LIGHT_LEFT=32,
    BRAKES_LIGHT_RIGHT=4194304,
    CABIN_FRONT_LEFT_LIGHT_IS_ON=65536,
    CABIN_REAR_LEFT_LIGHT_IS_ON=262144,
    CABIN_REAR_RIGHT_LIGHT_IS_ON=131072,
    CABIN__FRONT_RIGHT_LIGHT_IS_ON=32768,
    FRONT_GLASS_IS_BROKEN=16,
    FRONT_LEFT_LIGHT_IS_TURNED_ON=64,
    LEFT_FRONT_DOOR_IS_OPEN1=128,
    LEFT_FRONT_DOOR_IS_OPEN2=256,
    LEFT_FRONT_DOOR_IS_OPEN3=512,
    LEFT_FRONT_DOOR_IS_OPEN4=1024,
    LEFT_FRONT_LIGHT_IS_BROKEN=4,
    LEFT_REAR_LIGHT_IS_BROKEN=2,
    RIGHT_FRONT_DOOR_OPEN1=16777216,
    RIGHT_FRONT_DOOR_OPEN2=33554432,
    RIGHT_FRONT_DOOR_OPEN3=67108864,
    RIGHT_FRONT_DOOR_OPEN4=134217728,
    RIGHT_FRONT_LIGHT_IS_BROKEN=8,
    RIGHT_FRONT_LIGHT_IS_ON=8388608,
    RIGHT_REAR_LIGHT_IS_BROKEN=1,
    UNBROKEN_TURNED_OFF=0,
    UNK_100000=1048576,
    UNK_200000=2097152,
    UNK_80000=524288
} CAR_LIGHTS_AND_DOORS_BITSTATE;

typedef struct Position Position, *PPosition;

typedef struct MaybeCarEngine MaybeCarEngine, *PMaybeCarEngine;

typedef enum CAR_MODEL {
    ALFA=0,
    ALLARD=1,
    AMDB4=2,
    APC=3,
    BANKVAN=4,
    BMW=5,
    BOXCAR=6,
    BOXTRUCK=7,
    BUG=8,
    BUICK=10,
    BUS=11,
    CAR15=15,
    CAR20=20,
    CAR43=43,
    CAR9=9,
    COPCAR=12,
    DART=13,
    EDSEL=14,
    EDSELFBI=84,
    FIAT=16,
    FIRETRUK=17,
    GRAHAM=18,
    GT24640=19,
    GTRUCK=21,
    GUNJEEP=22,
    HOTDOG=23,
    HOTDOG_D1=24,
    HOTDOG_D2=25,
    HOTDOG_D3=26,
    HOTDOG_D4=85,
    ICECREAM=27,
    ISETLIMO=28,
    ISETTA=29,
    JEEP=30,
    JEFFREY=31,
    KRSNABUS=86,
    LIMO=32,
    LIMO2=33,
    MEDICAR=34,
    MERC=35,
    MESSER=36,
    MIURA=37,
    MONSTER=38,
    MORGAN=39,
    MORRIS=40,
    PICKUP=41,
    RTYPE=42,
    SPIDER=44,
    SPRITE=45,
    STINGRAY=46,
    STRATOS=47,
    STRATOSB=48,
    STRIPETB=49,
    STYPE=50,
    STYPECAB=51,
    SWATVAN=52,
    T2000GT=53,
    TANK=54,
    TANKER=55,
    TAXI=56,
    TBIRD=57,
    TOWTRUCK=58,
    TRAIN=59,
    TRAINCAB=60,
    TRAINFB=61,
    TRANCEAM=62,
    TRUKCAB1=63,
    TRUKCAB2=64,
    TRUKCONT=65,
    TRUKTRNS=66,
    TVVAN=67,
    VAN=68,
    VESPA=69,
    VTYPE=70,
    WBTWIN=71,
    WRECK0=72,
    WRECK1=73,
    WRECK2=74,
    WRECK3=75,
    WRECK4=76,
    WRECK5=77,
    WRECK6=78,
    WRECK7=79,
    WRECK8=80,
    WRECK9=81,
    XK120=82,
    ZCX5=83
} CAR_MODEL;

typedef enum CAR_ENGINE_STATE {
    BROKEN_DOESNT_WORK=0,
    ENGINE_OFF=1,
    ENGINE_OFF2=6,
    ENGINE_ON=3,
    LIGHTS_ON_BUT_ENGINE_OFF_NO_FUEL=7,
    REL_TO_CAR_SIREN=4,
    TURNING_OFF=2,
    TURN_ENGINE_OFF=5
} CAR_ENGINE_STATE;

typedef enum CAR_SIREN_STATE {
    CAR_ALARM=8,
    SIREN_OFF=2,
    SIREN_ON=4,
    SIREN_UNK1=1,
    SIREN_UNK_10=16
} CAR_SIREN_STATE;

typedef enum HORN {
    HORN_ON=248
} HORN;

typedef enum WEAPON_INDEX {
    ARMY_GUN_JEEP=22,
    CAR_SMG=9,
    FIRE_TRUCK_GUN=20,
    GRENADE=5,
    MOLOTOV=4,
    PISTOL=0,
    ROCKET=2,
    SHOCKER=3,
    SMG=1,
    TANK_MAIN_GUN=19,
    UNK_WEAPON_6=6,
    UNK_WEAPON_7=7
} WEAPON_INDEX;

struct WEAPON_PLAYER_LIST {
    undefined field_0x0;
    undefined field_0x1;
    undefined field_0x2;
    undefined field_0x3;
    undefined field_0x4;
    undefined field_0x5;
    undefined field_0x6;
    undefined field_0x7;
    undefined field_0x8;
    undefined field_0x9;
    undefined field_0xa;
    undefined field_0xb;
    undefined field_0xc;
    undefined field_0xd;
    undefined field_0xe;
    undefined field_0xf;
    undefined field_0x10;
    undefined field_0x11;
    undefined field_0x12;
    undefined field_0x13;
    undefined field_0x14;
    undefined field_0x15;
    undefined field_0x16;
    undefined field_0x17;
    undefined field_0x18;
    undefined field_0x19;
    undefined field_0x1a;
    undefined field_0x1b;
    undefined field_0x1c;
    undefined field_0x1d;
    undefined field_0x1e;
    undefined field_0x1f;
    undefined field_0x20;
    undefined field_0x21;
    undefined field_0x22;
    undefined field_0x23;
    undefined field_0x24;
    undefined field_0x25;
    undefined field_0x26;
    undefined field_0x27;
    undefined field_0x28;
    undefined field_0x29;
    undefined field_0x2a;
    undefined field_0x2b;
    undefined field_0x2c;
    undefined field_0x2d;
    undefined field_0x2e;
    undefined field_0x2f;
    undefined field_0x30;
    undefined field_0x31;
    undefined field_0x32;
    undefined field_0x33;
    undefined field_0x34;
    undefined field_0x35;
    undefined field_0x36;
    undefined field_0x37;
    undefined field_0x38;
    undefined field_0x39;
    undefined field_0x3a;
    undefined field_0x3b;
    undefined field_0x3c;
    undefined field_0x3d;
    undefined field_0x3e;
    undefined field_0x3f;
    undefined field_0x40;
    undefined field_0x41;
    undefined field_0x42;
    undefined field_0x43;
    undefined field_0x44;
    undefined field_0x45;
    undefined field_0x46;
    undefined field_0x47;
    undefined field_0x48;
    undefined field_0x49;
    undefined field_0x4a;
    undefined field_0x4b;
    undefined field_0x4c;
    undefined field_0x4d;
    undefined field_0x4e;
    undefined field_0x4f;
    uint bitMask;
    undefined field_0x54;
    undefined field_0x55;
    undefined field_0x56;
    undefined field_0x57;
    undefined field_0x58;
    undefined field_0x59;
    undefined field_0x5a;
    undefined field_0x5b;
    undefined field_0x5c;
    undefined field_0x5d;
    undefined field_0x5e;
    undefined field_0x5f;
    undefined field_0x60;
    undefined field_0x61;
    undefined field_0x62;
    undefined field_0x63;
    undefined field_0x64;
    undefined field_0x65;
    undefined field_0x66;
    undefined field_0x67;
    undefined field_0x68;
    undefined field_0x69;
    undefined field_0x6a;
    undefined field_0x6b;
    undefined field_0x6c;
    undefined field_0x6d;
    undefined field_0x6e;
    undefined field_0x6f;
    undefined field_0x70;
    undefined field_0x71;
    undefined field_0x72;
    undefined field_0x73;
    undefined field_0x74;
    undefined field_0x75;
    undefined field_0x76;
    undefined field_0x77;
    undefined field_0x78;
    undefined field_0x79;
    undefined field_0x7a;
    undefined field_0x7b;
    undefined field_0x7c;
    undefined field_0x7d;
    undefined field_0x7e;
    undefined field_0x7f;
    undefined field_0x80;
    undefined field_0x81;
    undefined field_0x82;
    undefined field_0x83;
    undefined field_0x84;
    undefined field_0x85;
    undefined field_0x86;
    undefined field_0x87;
    undefined field_0x88;
    undefined field_0x89;
    undefined field_0x8a;
    undefined field_0x8b;
    undefined field_0x8c;
    undefined field_0x8d;
    undefined field_0x8e;
    undefined field_0x8f;
    undefined field_0x90;
    undefined field_0x91;
    undefined field_0x92;
    undefined field_0x93;
    undefined field_0x94;
    undefined field_0x95;
    undefined field_0x96;
    undefined field_0x97;
    undefined field_0x98;
    undefined field_0x99;
    undefined field_0x9a;
    undefined field_0x9b;
    undefined field_0x9c;
    undefined field_0x9d;
    undefined field_0x9e;
    undefined field_0x9f;
    undefined field_0xa0;
    undefined field_0xa1;
    undefined field_0xa2;
    undefined field_0xa3;
    undefined field_0xa4;
    undefined field_0xa5;
    undefined field_0xa6;
    undefined field_0xa7;
    undefined field_0xa8;
    undefined field_0xa9;
    undefined field_0xaa;
    undefined field_0xab;
    undefined field_0xac;
    undefined field_0xad;
    undefined field_0xae;
    undefined field_0xaf;
    undefined field_0xb0;
    undefined field_0xb1;
    undefined field_0xb2;
    undefined field_0xb3;
    undefined field_0xb4;
    undefined field_0xb5;
    undefined field_0xb6;
    undefined field_0xb7;
    undefined field_0xb8;
    undefined field_0xb9;
    undefined field_0xba;
    undefined field_0xbb;
    undefined field_0xbc;
    undefined field_0xbd;
    undefined field_0xbe;
    undefined field_0xbf;
    undefined field_0xc0;
    undefined field_0xc1;
    undefined field_0xc2;
    undefined field_0xc3;
    undefined field_0xc4;
    undefined field_0xc5;
    undefined field_0xc6;
    undefined field_0xc7;
    undefined field_0xc8;
    undefined field_0xc9;
    undefined field_0xca;
    undefined field_0xcb;
    undefined field_0xcc;
    undefined field_0xcd;
    undefined field_0xce;
    undefined field_0xcf;
    undefined field_0xd0;
    undefined field_0xd1;
    undefined field_0xd2;
    undefined field_0xd3;
    undefined field_0xd4;
    undefined field_0xd5;
    undefined field_0xd6;
    undefined field_0xd7;
    undefined field_0xd8;
    undefined field_0xd9;
    undefined field_0xda;
    undefined field_0xdb;
    undefined field_0xdc;
    undefined field_0xdd;
    undefined field_0xde;
    undefined field_0xdf;
    undefined field_0xe0;
    undefined field_0xe1;
    undefined field_0xe2;
    undefined field_0xe3;
    undefined field_0xe4;
    undefined field_0xe5;
    undefined field_0xe6;
    undefined field_0xe7;
    undefined field_0xe8;
    undefined field_0xe9;
    undefined field_0xea;
    undefined field_0xeb;
    undefined field_0xec;
    undefined field_0xed;
    undefined field_0xee;
    undefined field_0xef;
    undefined field_0xf0;
    undefined field_0xf1;
    undefined field_0xf2;
    undefined field_0xf3;
    undefined field_0xf4;
    undefined field_0xf5;
    undefined field_0xf6;
    undefined field_0xf7;
    undefined field_0xf8;
    undefined field_0xf9;
    undefined field_0xfa;
    undefined field_0xfb;
    undefined field_0xfc;
    undefined field_0xfd;
    undefined field_0xfe;
    undefined field_0xff;
    undefined field_0x100;
    undefined field_0x101;
    undefined field_0x102;
    undefined field_0x103;
    undefined field_0x104;
    undefined field_0x105;
    undefined field_0x106;
    undefined field_0x107;
    undefined field_0x108;
    undefined field_0x109;
    undefined field_0x10a;
    undefined field_0x10b;
    undefined field_0x10c;
    undefined field_0x10d;
    undefined field_0x10e;
    undefined field_0x10f;
    undefined field_0x110;
    undefined field_0x111;
    undefined field_0x112;
    undefined field_0x113;
    undefined field_0x114;
    undefined field_0x115;
    undefined field_0x116;
    undefined field_0x117;
    undefined field_0x118;
    undefined field_0x119;
    undefined field_0x11a;
    undefined field_0x11b;
    undefined field_0x11c;
    undefined field_0x11d;
    undefined field_0x11e;
    undefined field_0x11f;
    undefined field_0x120;
    undefined field_0x121;
    undefined field_0x122;
    undefined field_0x123;
    undefined field_0x124;
    undefined field_0x125;
    undefined field_0x126;
    undefined field_0x127;
    undefined field_0x128;
    undefined field_0x129;
    undefined field_0x12a;
    undefined field_0x12b;
    undefined field_0x12c;
    undefined field_0x12d;
    undefined field_0x12e;
    undefined field_0x12f;
    undefined field_0x130;
    undefined field_0x131;
    undefined field_0x132;
    undefined field_0x133;
    undefined field_0x134;
    undefined field_0x135;
    undefined field_0x136;
    undefined field_0x137;
    undefined field_0x138;
    undefined field_0x139;
    undefined field_0x13a;
    undefined field_0x13b;
    undefined field_0x13c;
    undefined field_0x13d;
    undefined field_0x13e;
    undefined field_0x13f;
    undefined field_0x140;
    undefined field_0x141;
    undefined field_0x142;
    undefined field_0x143;
    undefined field_0x144;
    undefined field_0x145;
    undefined field_0x146;
    undefined field_0x147;
    undefined field_0x148;
    undefined field_0x149;
    undefined field_0x14a;
    undefined field_0x14b;
    undefined field_0x14c;
    undefined field_0x14d;
    undefined field_0x14e;
    undefined field_0x14f;
    undefined field_0x150;
    undefined field_0x151;
    undefined field_0x152;
    undefined field_0x153;
    undefined field_0x154;
    undefined field_0x155;
    undefined field_0x156;
    undefined field_0x157;
    undefined field_0x158;
    undefined field_0x159;
    undefined field_0x15a;
    undefined field_0x15b;
    undefined field_0x15c;
    undefined field_0x15d;
    undefined field_0x15e;
    undefined field_0x15f;
    undefined field_0x160;
    undefined field_0x161;
    undefined field_0x162;
    undefined field_0x163;
    undefined field_0x164;
    undefined field_0x165;
    undefined field_0x166;
    undefined field_0x167;
    undefined field_0x168;
    undefined field_0x169;
    undefined field_0x16a;
    undefined field_0x16b;
    undefined field_0x16c;
    undefined field_0x16d;
    undefined field_0x16e;
    undefined field_0x16f;
    undefined field_0x170;
    undefined field_0x171;
    undefined field_0x172;
    undefined field_0x173;
    undefined field_0x174;
    undefined field_0x175;
    undefined field_0x176;
    undefined field_0x177;
    undefined field_0x178;
    undefined field_0x179;
    undefined field_0x17a;
    undefined field_0x17b;
    undefined field_0x17c;
    undefined field_0x17d;
    undefined field_0x17e;
    undefined field_0x17f;
    undefined field_0x180;
    undefined field_0x181;
    undefined field_0x182;
    undefined field_0x183;
    undefined field_0x184;
    undefined field_0x185;
    undefined field_0x186;
    undefined field_0x187;
    undefined field_0x188;
    undefined field_0x189;
    undefined field_0x18a;
    undefined field_0x18b;
    undefined field_0x18c;
    undefined field_0x18d;
    undefined field_0x18e;
    undefined field_0x18f;
    undefined field_0x190;
    undefined field_0x191;
    undefined field_0x192;
    undefined field_0x193;
    undefined field_0x194;
    undefined field_0x195;
    undefined field_0x196;
    undefined field_0x197;
    undefined field_0x198;
    undefined field_0x199;
    undefined field_0x19a;
    undefined field_0x19b;
    undefined field_0x19c;
    undefined field_0x19d;
    undefined field_0x19e;
    undefined field_0x19f;
    undefined field_0x1a0;
    undefined field_0x1a1;
    undefined field_0x1a2;
    undefined field_0x1a3;
    undefined field_0x1a4;
    undefined field_0x1a5;
    undefined field_0x1a6;
    undefined field_0x1a7;
    undefined field_0x1a8;
    undefined field_0x1a9;
    undefined field_0x1aa;
    undefined field_0x1ab;
    undefined field_0x1ac;
    undefined field_0x1ad;
    undefined field_0x1ae;
    undefined field_0x1af;
    undefined field_0x1b0;
    undefined field_0x1b1;
    undefined field_0x1b2;
    undefined field_0x1b3;
    undefined field_0x1b4;
    undefined field_0x1b5;
    undefined field_0x1b6;
    undefined field_0x1b7;
    undefined field_0x1b8;
    undefined field_0x1b9;
    undefined field_0x1ba;
    undefined field_0x1bb;
    undefined field_0x1bc;
    undefined field_0x1bd;
    undefined field_0x1be;
    undefined field_0x1bf;
    undefined field_0x1c0;
    undefined field_0x1c1;
    undefined field_0x1c2;
    undefined field_0x1c3;
    undefined field_0x1c4;
    undefined field_0x1c5;
    undefined field_0x1c6;
    undefined field_0x1c7;
    undefined field_0x1c8;
    undefined field_0x1c9;
    undefined field_0x1ca;
    undefined field_0x1cb;
    undefined field_0x1cc;
    undefined field_0x1cd;
    undefined field_0x1ce;
    undefined field_0x1cf;
    undefined field_0x1d0;
    undefined field_0x1d1;
    undefined field_0x1d2;
    undefined field_0x1d3;
    undefined field_0x1d4;
    undefined field_0x1d5;
    undefined field_0x1d6;
    undefined field_0x1d7;
    undefined field_0x1d8;
    undefined field_0x1d9;
    undefined field_0x1da;
    undefined field_0x1db;
    undefined field_0x1dc;
    undefined field_0x1dd;
    undefined field_0x1de;
    undefined field_0x1df;
    undefined field_0x1e0;
    undefined field_0x1e1;
    undefined field_0x1e2;
    undefined field_0x1e3;
    undefined field_0x1e4;
    undefined field_0x1e5;
    undefined field_0x1e6;
    undefined field_0x1e7;
    undefined field_0x1e8;
    undefined field_0x1e9;
    undefined field_0x1ea;
    undefined field_0x1eb;
    undefined field_0x1ec;
    undefined field_0x1ed;
    undefined field_0x1ee;
    undefined field_0x1ef;
    undefined field_0x1f0;
    undefined field_0x1f1;
    undefined field_0x1f2;
    undefined field_0x1f3;
    undefined field_0x1f4;
    undefined field_0x1f5;
    undefined field_0x1f6;
    undefined field_0x1f7;
    undefined field_0x1f8;
    undefined field_0x1f9;
    undefined field_0x1fa;
    undefined field_0x1fb;
    undefined field_0x1fc;
    undefined field_0x1fd;
    undefined field_0x1fe;
    undefined field_0x1ff;
    undefined field_0x200;
    undefined field_0x201;
    undefined field_0x202;
    undefined field_0x203;
    undefined field_0x204;
    undefined field_0x205;
    undefined field_0x206;
    undefined field_0x207;
    undefined field_0x208;
    undefined field_0x209;
    undefined field_0x20a;
    undefined field_0x20b;
    undefined field_0x20c;
    undefined field_0x20d;
    undefined field_0x20e;
    undefined field_0x20f;
    undefined field_0x210;
    undefined field_0x211;
    undefined field_0x212;
    undefined field_0x213;
    undefined field_0x214;
    undefined field_0x215;
    undefined field_0x216;
    undefined field_0x217;
    undefined field_0x218;
    undefined field_0x219;
    undefined field_0x21a;
    undefined field_0x21b;
    undefined field_0x21c;
    undefined field_0x21d;
    undefined field_0x21e;
    undefined field_0x21f;
    undefined field_0x220;
    undefined field_0x221;
    undefined field_0x222;
    undefined field_0x223;
    undefined field_0x224;
    undefined field_0x225;
    undefined field_0x226;
    undefined field_0x227;
    undefined field_0x228;
    undefined field_0x229;
    undefined field_0x22a;
    undefined field_0x22b;
    undefined field_0x22c;
    undefined field_0x22d;
    undefined field_0x22e;
    undefined field_0x22f;
    undefined field_0x230;
    undefined field_0x231;
    undefined field_0x232;
    undefined field_0x233;
    undefined field_0x234;
    undefined field_0x235;
    undefined field_0x236;
    undefined field_0x237;
    undefined field_0x238;
    undefined field_0x239;
    undefined field_0x23a;
    undefined field_0x23b;
    undefined field_0x23c;
    undefined field_0x23d;
    undefined field_0x23e;
    undefined field_0x23f;
    undefined field_0x240;
    undefined field_0x241;
    undefined field_0x242;
    undefined field_0x243;
    undefined field_0x244;
    undefined field_0x245;
    undefined field_0x246;
    undefined field_0x247;
    undefined field_0x248;
    undefined field_0x249;
    undefined field_0x24a;
    undefined field_0x24b;
    undefined field_0x24c;
    undefined field_0x24d;
    undefined field_0x24e;
    undefined field_0x24f;
    undefined field_0x250;
    undefined field_0x251;
    undefined field_0x252;
    undefined field_0x253;
    undefined field_0x254;
    undefined field_0x255;
    undefined field_0x256;
    undefined field_0x257;
    undefined field_0x258;
    undefined field_0x259;
    undefined field_0x25a;
    undefined field_0x25b;
    undefined field_0x25c;
    undefined field_0x25d;
    undefined field_0x25e;
    undefined field_0x25f;
    undefined field_0x260;
    undefined field_0x261;
    undefined field_0x262;
    undefined field_0x263;
    undefined field_0x264;
    undefined field_0x265;
    undefined field_0x266;
    undefined field_0x267;
    undefined field_0x268;
    undefined field_0x269;
    undefined field_0x26a;
    undefined field_0x26b;
    undefined field_0x26c;
    undefined field_0x26d;
    undefined field_0x26e;
    undefined field_0x26f;
    undefined field_0x270;
    undefined field_0x271;
    undefined field_0x272;
    undefined field_0x273;
    undefined field_0x274;
    undefined field_0x275;
    undefined field_0x276;
    undefined field_0x277;
    undefined field_0x278;
    undefined field_0x279;
    undefined field_0x27a;
    undefined field_0x27b;
    undefined field_0x27c;
    undefined field_0x27d;
    undefined field_0x27e;
    undefined field_0x27f;
    undefined field_0x280;
    undefined field_0x281;
    undefined field_0x282;
    undefined field_0x283;
    undefined field_0x284;
    undefined field_0x285;
    undefined field_0x286;
    undefined field_0x287;
    undefined field_0x288;
    undefined field_0x289;
    undefined field_0x28a;
    undefined field_0x28b;
    undefined field_0x28c;
    undefined field_0x28d;
    undefined field_0x28e;
    undefined field_0x28f;
    undefined field_0x290;
    undefined field_0x291;
    undefined field_0x292;
    undefined field_0x293;
    undefined field_0x294;
    undefined field_0x295;
    undefined field_0x296;
    undefined field_0x297;
    undefined field_0x298;
    undefined field_0x299;
    undefined field_0x29a;
    undefined field_0x29b;
    undefined field_0x29c;
    undefined field_0x29d;
    undefined field_0x29e;
    undefined field_0x29f;
    undefined field_0x2a0;
    undefined field_0x2a1;
    undefined field_0x2a2;
    undefined field_0x2a3;
    undefined field_0x2a4;
    undefined field_0x2a5;
    undefined field_0x2a6;
    undefined field_0x2a7;
    undefined field_0x2a8;
    undefined field_0x2a9;
    undefined field_0x2aa;
    undefined field_0x2ab;
    undefined field_0x2ac;
    undefined field_0x2ad;
    undefined field_0x2ae;
    undefined field_0x2af;
    undefined field_0x2b0;
    undefined field_0x2b1;
    undefined field_0x2b2;
    undefined field_0x2b3;
    undefined field_0x2b4;
    undefined field_0x2b5;
    undefined field_0x2b6;
    undefined field_0x2b7;
    undefined field_0x2b8;
    undefined field_0x2b9;
    undefined field_0x2ba;
    undefined field_0x2bb;
    undefined field_0x2bc;
    undefined field_0x2bd;
    undefined field_0x2be;
    undefined field_0x2bf;
    undefined field_0x2c0;
    undefined field_0x2c1;
    undefined field_0x2c2;
    undefined field_0x2c3;
    undefined field_0x2c4;
    undefined field_0x2c5;
    undefined field_0x2c6;
    undefined field_0x2c7;
    undefined field_0x2c8;
    undefined field_0x2c9;
    undefined field_0x2ca;
    undefined field_0x2cb;
    undefined field_0x2cc;
    undefined field_0x2cd;
    undefined field_0x2ce;
    undefined field_0x2cf;
    undefined field_0x2d0;
    undefined field_0x2d1;
    undefined field_0x2d2;
    undefined field_0x2d3;
    undefined field_0x2d4;
    undefined field_0x2d5;
    undefined field_0x2d6;
    undefined field_0x2d7;
    undefined field_0x2d8;
    undefined field_0x2d9;
    undefined field_0x2da;
    undefined field_0x2db;
    undefined field_0x2dc;
    undefined field_0x2dd;
    undefined field_0x2de;
    undefined field_0x2df;
    undefined field_0x2e0;
    undefined field_0x2e1;
    undefined field_0x2e2;
    undefined field_0x2e3;
    undefined field_0x2e4;
    undefined field_0x2e5;
    undefined field_0x2e6;
    undefined field_0x2e7;
    undefined field_0x2e8;
    undefined field_0x2e9;
    undefined field_0x2ea;
    undefined field_0x2eb;
    undefined field_0x2ec;
    undefined field_0x2ed;
    undefined field_0x2ee;
    undefined field_0x2ef;
    undefined field_0x2f0;
    undefined field_0x2f1;
    undefined field_0x2f2;
    undefined field_0x2f3;
    undefined field_0x2f4;
    undefined field_0x2f5;
    undefined field_0x2f6;
    undefined field_0x2f7;
    undefined field_0x2f8;
    undefined field_0x2f9;
    undefined field_0x2fa;
    undefined field_0x2fb;
    undefined field_0x2fc;
    undefined field_0x2fd;
    undefined field_0x2fe;
    undefined field_0x2ff;
    undefined field_0x300;
    undefined field_0x301;
    undefined field_0x302;
    undefined field_0x303;
    undefined field_0x304;
    undefined field_0x305;
    undefined field_0x306;
    undefined field_0x307;
    undefined field_0x308;
    undefined field_0x309;
    undefined field_0x30a;
    undefined field_0x30b;
    undefined field_0x30c;
    undefined field_0x30d;
    undefined field_0x30e;
    undefined field_0x30f;
    undefined field_0x310;
    undefined field_0x311;
    undefined field_0x312;
    undefined field_0x313;
    undefined field_0x314;
    undefined field_0x315;
    undefined field_0x316;
    undefined field_0x317;
    undefined field_0x318;
    undefined field_0x319;
    undefined field_0x31a;
    undefined field_0x31b;
    undefined field_0x31c;
    undefined field_0x31d;
    undefined field_0x31e;
    undefined field_0x31f;
    undefined field_0x320;
    undefined field_0x321;
    undefined field_0x322;
    undefined field_0x323;
    undefined field_0x324;
    undefined field_0x325;
    undefined field_0x326;
    undefined field_0x327;
    undefined field_0x328;
    undefined field_0x329;
    undefined field_0x32a;
    undefined field_0x32b;
    undefined field_0x32c;
    undefined field_0x32d;
    undefined field_0x32e;
    undefined field_0x32f;
    undefined field_0x330;
    undefined field_0x331;
    undefined field_0x332;
    undefined field_0x333;
    undefined field_0x334;
    undefined field_0x335;
    undefined field_0x336;
    undefined field_0x337;
    undefined field_0x338;
    undefined field_0x339;
    undefined field_0x33a;
    undefined field_0x33b;
    undefined field_0x33c;
    undefined field_0x33d;
    undefined field_0x33e;
    undefined field_0x33f;
    undefined field_0x340;
    undefined field_0x341;
    undefined field_0x342;
    undefined field_0x343;
    undefined field_0x344;
    undefined field_0x345;
    undefined field_0x346;
    undefined field_0x347;
    undefined field_0x348;
    undefined field_0x349;
    undefined field_0x34a;
    undefined field_0x34b;
    undefined field_0x34c;
    undefined field_0x34d;
    undefined field_0x34e;
    undefined field_0x34f;
    undefined field_0x350;
    undefined field_0x351;
    undefined field_0x352;
    undefined field_0x353;
    undefined field_0x354;
    undefined field_0x355;
    undefined field_0x356;
    undefined field_0x357;
    undefined field_0x358;
    undefined field_0x359;
    undefined field_0x35a;
    undefined field_0x35b;
    undefined field_0x35c;
    undefined field_0x35d;
    undefined field_0x35e;
    undefined field_0x35f;
    undefined field_0x360;
    undefined field_0x361;
    undefined field_0x362;
    undefined field_0x363;
    undefined field_0x364;
    undefined field_0x365;
    undefined field_0x366;
    undefined field_0x367;
    undefined field_0x368;
    undefined field_0x369;
    undefined field_0x36a;
    undefined field_0x36b;
    undefined field_0x36c;
    undefined field_0x36d;
    undefined field_0x36e;
    undefined field_0x36f;
    undefined field_0x370;
    undefined field_0x371;
    undefined field_0x372;
    undefined field_0x373;
    undefined field_0x374;
    undefined field_0x375;
    undefined field_0x376;
    undefined field_0x377;
    undefined field_0x378;
    undefined field_0x379;
    undefined field_0x37a;
    undefined field_0x37b;
    undefined field_0x37c;
    undefined field_0x37d;
    undefined field_0x37e;
    undefined field_0x37f;
    undefined field_0x380;
    undefined field_0x381;
    undefined field_0x382;
    undefined field_0x383;
    undefined field_0x384;
    undefined field_0x385;
    undefined field_0x386;
    undefined field_0x387;
    undefined field_0x388;
    undefined field_0x389;
    undefined field_0x38a;
    undefined field_0x38b;
    undefined field_0x38c;
    undefined field_0x38d;
    undefined field_0x38e;
    undefined field_0x38f;
    undefined field_0x390;
    undefined field_0x391;
    undefined field_0x392;
    undefined field_0x393;
    undefined field_0x394;
    undefined field_0x395;
    undefined field_0x396;
    undefined field_0x397;
    undefined field_0x398;
    undefined field_0x399;
    undefined field_0x39a;
    undefined field_0x39b;
    undefined field_0x39c;
    undefined field_0x39d;
    undefined field_0x39e;
    undefined field_0x39f;
    undefined field_0x3a0;
    undefined field_0x3a1;
    undefined field_0x3a2;
    undefined field_0x3a3;
    undefined field_0x3a4;
    undefined field_0x3a5;
    undefined field_0x3a6;
    undefined field_0x3a7;
    undefined field_0x3a8;
    undefined field_0x3a9;
    undefined field_0x3aa;
    undefined field_0x3ab;
    undefined field_0x3ac;
    undefined field_0x3ad;
    undefined field_0x3ae;
    undefined field_0x3af;
    undefined field_0x3b0;
    undefined field_0x3b1;
    undefined field_0x3b2;
    undefined field_0x3b3;
    undefined field_0x3b4;
    undefined field_0x3b5;
    undefined field_0x3b6;
    undefined field_0x3b7;
    undefined field_0x3b8;
    undefined field_0x3b9;
    undefined field_0x3ba;
    undefined field_0x3bb;
    undefined field_0x3bc;
    undefined field_0x3bd;
    undefined field_0x3be;
    undefined field_0x3bf;
    undefined field_0x3c0;
    undefined field_0x3c1;
    undefined field_0x3c2;
    undefined field_0x3c3;
    undefined field_0x3c4;
    undefined field_0x3c5;
    undefined field_0x3c6;
    undefined field_0x3c7;
    undefined field_0x3c8;
    undefined field_0x3c9;
    undefined field_0x3ca;
    undefined field_0x3cb;
    undefined field_0x3cc;
    undefined field_0x3cd;
    undefined field_0x3ce;
    undefined field_0x3cf;
    undefined field_0x3d0;
    undefined field_0x3d1;
    undefined field_0x3d2;
    undefined field_0x3d3;
    undefined field_0x3d4;
    undefined field_0x3d5;
    undefined field_0x3d6;
    undefined field_0x3d7;
    undefined field_0x3d8;
    undefined field_0x3d9;
    undefined field_0x3da;
    undefined field_0x3db;
    undefined field_0x3dc;
    undefined field_0x3dd;
    undefined field_0x3de;
    undefined field_0x3df;
    undefined field_0x3e0;
    undefined field_0x3e1;
    undefined field_0x3e2;
    undefined field_0x3e3;
    undefined field_0x3e4;
    undefined field_0x3e5;
    undefined field_0x3e6;
    undefined field_0x3e7;
    undefined field_0x3e8;
    undefined field_0x3e9;
    undefined field_0x3ea;
    undefined field_0x3eb;
    undefined field_0x3ec;
    undefined field_0x3ed;
    undefined field_0x3ee;
    undefined field_0x3ef;
    undefined field_0x3f0;
    undefined field_0x3f1;
    undefined field_0x3f2;
    undefined field_0x3f3;
    undefined field_0x3f4;
    undefined field_0x3f5;
    undefined field_0x3f6;
    undefined field_0x3f7;
    undefined field_0x3f8;
    undefined field_0x3f9;
    undefined field_0x3fa;
    undefined field_0x3fb;
    undefined field_0x3fc;
    undefined field_0x3fd;
    undefined field_0x3fe;
    undefined field_0x3ff;
    undefined field_0x400;
    undefined field_0x401;
    undefined field_0x402;
    undefined field_0x403;
    undefined field_0x404;
    undefined field_0x405;
    undefined field_0x406;
    undefined field_0x407;
    undefined field_0x408;
    undefined field_0x409;
    undefined field_0x40a;
    undefined field_0x40b;
    undefined field_0x40c;
    undefined field_0x40d;
    undefined field_0x40e;
    undefined field_0x40f;
    undefined field_0x410;
    undefined field_0x411;
    undefined field_0x412;
    undefined field_0x413;
    undefined field_0x414;
    undefined field_0x415;
    undefined field_0x416;
    undefined field_0x417;
    undefined field_0x418;
    undefined field_0x419;
    undefined field_0x41a;
    undefined field_0x41b;
    undefined field_0x41c;
    undefined field_0x41d;
    undefined field_0x41e;
    undefined field_0x41f;
    undefined field_0x420;
    undefined field_0x421;
    undefined field_0x422;
    undefined field_0x423;
    undefined field_0x424;
    undefined field_0x425;
    undefined field_0x426;
    undefined field_0x427;
    undefined field_0x428;
    undefined field_0x429;
    undefined field_0x42a;
    undefined field_0x42b;
    undefined field_0x42c;
    undefined field_0x42d;
    undefined field_0x42e;
    undefined field_0x42f;
    undefined field_0x430;
    undefined field_0x431;
    undefined field_0x432;
    undefined field_0x433;
    undefined field_0x434;
    undefined field_0x435;
    undefined field_0x436;
    undefined field_0x437;
    undefined field_0x438;
    undefined field_0x439;
    undefined field_0x43a;
    undefined field_0x43b;
    undefined field_0x43c;
    undefined field_0x43d;
    undefined field_0x43e;
    undefined field_0x43f;
    undefined field_0x440;
    undefined field_0x441;
    undefined field_0x442;
    undefined field_0x443;
    undefined field_0x444;
    undefined field_0x445;
    undefined field_0x446;
    undefined field_0x447;
    undefined field_0x448;
    undefined field_0x449;
    undefined field_0x44a;
    undefined field_0x44b;
    undefined field_0x44c;
    undefined field_0x44d;
    undefined field_0x44e;
    undefined field_0x44f;
    undefined field_0x450;
    undefined field_0x451;
    undefined field_0x452;
    undefined field_0x453;
    undefined field_0x454;
    undefined field_0x455;
    undefined field_0x456;
    undefined field_0x457;
    undefined field_0x458;
    undefined field_0x459;
    undefined field_0x45a;
    undefined field_0x45b;
    undefined field_0x45c;
    undefined field_0x45d;
    undefined field_0x45e;
    undefined field_0x45f;
    undefined field_0x460;
    undefined field_0x461;
    undefined field_0x462;
    undefined field_0x463;
    undefined field_0x464;
    undefined field_0x465;
    undefined field_0x466;
    undefined field_0x467;
    undefined field_0x468;
    undefined field_0x469;
    undefined field_0x46a;
    undefined field_0x46b;
    undefined field_0x46c;
    undefined field_0x46d;
    undefined field_0x46e;
    undefined field_0x46f;
    undefined field_0x470;
    undefined field_0x471;
    undefined field_0x472;
    undefined field_0x473;
    undefined field_0x474;
    undefined field_0x475;
    undefined field_0x476;
    undefined field_0x477;
    undefined field_0x478;
    undefined field_0x479;
    undefined field_0x47a;
    undefined field_0x47b;
    undefined field_0x47c;
    undefined field_0x47d;
    undefined field_0x47e;
    undefined field_0x47f;
    undefined field_0x480;
    undefined field_0x481;
    undefined field_0x482;
    undefined field_0x483;
    undefined field_0x484;
    undefined field_0x485;
    undefined field_0x486;
    undefined field_0x487;
    undefined field_0x488;
    undefined field_0x489;
    undefined field_0x48a;
    undefined field_0x48b;
    undefined field_0x48c;
    undefined field_0x48d;
    undefined field_0x48e;
    undefined field_0x48f;
    undefined field_0x490;
    undefined field_0x491;
    undefined field_0x492;
    undefined field_0x493;
    undefined field_0x494;
    undefined field_0x495;
    undefined field_0x496;
    undefined field_0x497;
    undefined field_0x498;
    undefined field_0x499;
    undefined field_0x49a;
    undefined field_0x49b;
    undefined field_0x49c;
    undefined field_0x49d;
    undefined field_0x49e;
    undefined field_0x49f;
    undefined field_0x4a0;
    undefined field_0x4a1;
    undefined field_0x4a2;
    undefined field_0x4a3;
    undefined field_0x4a4;
    undefined field_0x4a5;
    undefined field_0x4a6;
    undefined field_0x4a7;
    undefined field_0x4a8;
    undefined field_0x4a9;
    undefined field_0x4aa;
    undefined field_0x4ab;
    undefined field_0x4ac;
    undefined field_0x4ad;
    undefined field_0x4ae;
    undefined field_0x4af;
    undefined field_0x4b0;
    undefined field_0x4b1;
    undefined field_0x4b2;
    undefined field_0x4b3;
    undefined field_0x4b4;
    undefined field_0x4b5;
    undefined field_0x4b6;
    undefined field_0x4b7;
    undefined field_0x4b8;
    undefined field_0x4b9;
    undefined field_0x4ba;
    undefined field_0x4bb;
    undefined field_0x4bc;
    undefined field_0x4bd;
    undefined field_0x4be;
    undefined field_0x4bf;
    undefined field_0x4c0;
    undefined field_0x4c1;
    undefined field_0x4c2;
    undefined field_0x4c3;
    undefined field_0x4c4;
    undefined field_0x4c5;
    undefined field_0x4c6;
    undefined field_0x4c7;
    undefined field_0x4c8;
    undefined field_0x4c9;
    undefined field_0x4ca;
    undefined field_0x4cb;
    undefined field_0x4cc;
    undefined field_0x4cd;
    undefined field_0x4ce;
    undefined field_0x4cf;
    undefined field_0x4d0;
    undefined field_0x4d1;
    undefined field_0x4d2;
    undefined field_0x4d3;
    undefined field_0x4d4;
    undefined field_0x4d5;
    undefined field_0x4d6;
    undefined field_0x4d7;
    undefined field_0x4d8;
    undefined field_0x4d9;
    undefined field_0x4da;
    undefined field_0x4db;
    undefined field_0x4dc;
    undefined field_0x4dd;
    undefined field_0x4de;
    undefined field_0x4df;
    undefined field_0x4e0;
    undefined field_0x4e1;
    undefined field_0x4e2;
    undefined field_0x4e3;
    undefined field_0x4e4;
    undefined field_0x4e5;
    undefined field_0x4e6;
    undefined field_0x4e7;
    undefined field_0x4e8;
    undefined field_0x4e9;
    undefined field_0x4ea;
    undefined field_0x4eb;
    undefined field_0x4ec;
    undefined field_0x4ed;
    undefined field_0x4ee;
    undefined field_0x4ef;
    undefined field_0x4f0;
    undefined field_0x4f1;
    undefined field_0x4f2;
    undefined field_0x4f3;
    undefined field_0x4f4;
    undefined field_0x4f5;
    undefined field_0x4f6;
    undefined field_0x4f7;
    undefined field_0x4f8;
    undefined field_0x4f9;
    undefined field_0x4fa;
    undefined field_0x4fb;
    undefined field_0x4fc;
    undefined field_0x4fd;
    undefined field_0x4fe;
    undefined field_0x4ff;
    undefined field_0x500;
    undefined field_0x501;
    undefined field_0x502;
    undefined field_0x503;
    undefined field_0x504;
    undefined field_0x505;
    undefined field_0x506;
    undefined field_0x507;
    undefined field_0x508;
    undefined field_0x509;
    undefined field_0x50a;
    undefined field_0x50b;
    undefined field_0x50c;
    undefined field_0x50d;
    undefined field_0x50e;
    undefined field_0x50f;
    undefined field_0x510;
    undefined field_0x511;
    undefined field_0x512;
    undefined field_0x513;
    undefined field_0x514;
    undefined field_0x515;
    undefined field_0x516;
    undefined field_0x517;
    undefined field_0x518;
    undefined field_0x519;
    undefined field_0x51a;
    undefined field_0x51b;
    undefined field_0x51c;
    undefined field_0x51d;
    undefined field_0x51e;
    undefined field_0x51f;
    undefined field_0x520;
    undefined field_0x521;
    undefined field_0x522;
    undefined field_0x523;
    undefined field_0x524;
    undefined field_0x525;
    undefined field_0x526;
    undefined field_0x527;
    undefined field_0x528;
    undefined field_0x529;
    undefined field_0x52a;
    undefined field_0x52b;
    undefined field_0x52c;
    undefined field_0x52d;
    undefined field_0x52e;
    undefined field_0x52f;
    undefined field_0x530;
    undefined field_0x531;
    undefined field_0x532;
    undefined field_0x533;
    undefined field_0x534;
    undefined field_0x535;
    undefined field_0x536;
    undefined field_0x537;
    undefined field_0x538;
    undefined field_0x539;
    undefined field_0x53a;
    undefined field_0x53b;
    undefined field_0x53c;
    undefined field_0x53d;
    undefined field_0x53e;
    undefined field_0x53f;
    undefined field_0x540;
    undefined field_0x541;
    undefined field_0x542;
    undefined field_0x543;
    undefined field_0x544;
    undefined field_0x545;
    undefined field_0x546;
    undefined field_0x547;
    undefined field_0x548;
    undefined field_0x549;
    undefined field_0x54a;
    undefined field_0x54b;
    undefined field_0x54c;
    undefined field_0x54d;
    undefined field_0x54e;
    undefined field_0x54f;
    undefined field_0x550;
    undefined field_0x551;
    undefined field_0x552;
    undefined field_0x553;
    undefined field_0x554;
    undefined field_0x555;
    undefined field_0x556;
    undefined field_0x557;
    undefined field_0x558;
    undefined field_0x559;
    undefined field_0x55a;
    undefined field_0x55b;
    undefined field_0x55c;
    undefined field_0x55d;
    undefined field_0x55e;
    undefined field_0x55f;
    undefined field_0x560;
    undefined field_0x561;
    undefined field_0x562;
    undefined field_0x563;
    undefined field_0x564;
    undefined field_0x565;
    undefined field_0x566;
    undefined field_0x567;
    undefined field_0x568;
    undefined field_0x569;
    undefined field_0x56a;
    undefined field_0x56b;
    undefined field_0x56c;
    undefined field_0x56d;
    undefined field_0x56e;
    undefined field_0x56f;
    undefined field_0x570;
    undefined field_0x571;
    undefined field_0x572;
    undefined field_0x573;
    undefined field_0x574;
    undefined field_0x575;
    undefined field_0x576;
    undefined field_0x577;
    undefined field_0x578;
    undefined field_0x579;
    undefined field_0x57a;
    undefined field_0x57b;
    undefined field_0x57c;
    undefined field_0x57d;
    undefined field_0x57e;
    undefined field_0x57f;
    undefined field_0x580;
    undefined field_0x581;
    undefined field_0x582;
    undefined field_0x583;
    undefined field_0x584;
    undefined field_0x585;
    undefined field_0x586;
    undefined field_0x587;
    undefined field_0x588;
    undefined field_0x589;
    undefined field_0x58a;
    undefined field_0x58b;
    undefined field_0x58c;
    undefined field_0x58d;
    undefined field_0x58e;
    undefined field_0x58f;
    undefined field_0x590;
    undefined field_0x591;
    undefined field_0x592;
    undefined field_0x593;
    undefined field_0x594;
    undefined field_0x595;
    undefined field_0x596;
    undefined field_0x597;
    undefined field_0x598;
    undefined field_0x599;
    undefined field_0x59a;
    undefined field_0x59b;
    undefined field_0x59c;
    undefined field_0x59d;
    undefined field_0x59e;
    undefined field_0x59f;
    undefined field_0x5a0;
    undefined field_0x5a1;
    undefined field_0x5a2;
    undefined field_0x5a3;
    undefined field_0x5a4;
    undefined field_0x5a5;
    undefined field_0x5a6;
    undefined field_0x5a7;
    undefined field_0x5a8;
    undefined field_0x5a9;
    undefined field_0x5aa;
    undefined field_0x5ab;
    undefined field_0x5ac;
    undefined field_0x5ad;
    undefined field_0x5ae;
    undefined field_0x5af;
    undefined field_0x5b0;
    undefined field_0x5b1;
    undefined field_0x5b2;
    undefined field_0x5b3;
    undefined field_0x5b4;
    undefined field_0x5b5;
    undefined field_0x5b6;
    undefined field_0x5b7;
    undefined field_0x5b8;
    undefined field_0x5b9;
    undefined field_0x5ba;
    undefined field_0x5bb;
    undefined field_0x5bc;
    undefined field_0x5bd;
    undefined field_0x5be;
    undefined field_0x5bf;
    undefined field_0x5c0;
    undefined field_0x5c1;
    undefined field_0x5c2;
    undefined field_0x5c3;
    undefined field_0x5c4;
    undefined field_0x5c5;
    undefined field_0x5c6;
    undefined field_0x5c7;
    undefined field_0x5c8;
    undefined field_0x5c9;
    undefined field_0x5ca;
    undefined field_0x5cb;
    undefined field_0x5cc;
    undefined field_0x5cd;
    undefined field_0x5ce;
    undefined field_0x5cf;
    undefined field_0x5d0;
    undefined field_0x5d1;
    undefined field_0x5d2;
    undefined field_0x5d3;
    undefined field_0x5d4;
    undefined field_0x5d5;
    undefined field_0x5d6;
    undefined field_0x5d7;
    undefined field_0x5d8;
    undefined field_0x5d9;
    undefined field_0x5da;
    undefined field_0x5db;
    undefined field_0x5dc;
    undefined field_0x5dd;
    undefined field_0x5de;
    undefined field_0x5df;
    undefined field_0x5e0;
    undefined field_0x5e1;
    undefined field_0x5e2;
    undefined field_0x5e3;
    undefined field_0x5e4;
    undefined field_0x5e5;
    undefined field_0x5e6;
    undefined field_0x5e7;
    undefined field_0x5e8;
    undefined field_0x5e9;
    undefined field_0x5ea;
    undefined field_0x5eb;
    undefined field_0x5ec;
    undefined field_0x5ed;
    undefined field_0x5ee;
    undefined field_0x5ef;
    undefined field_0x5f0;
    undefined field_0x5f1;
    undefined field_0x5f2;
    undefined field_0x5f3;
    undefined field_0x5f4;
    undefined field_0x5f5;
    undefined field_0x5f6;
    undefined field_0x5f7;
    undefined field_0x5f8;
    undefined field_0x5f9;
    undefined field_0x5fa;
    undefined field_0x5fb;
    undefined field_0x5fc;
    undefined field_0x5fd;
    undefined field_0x5fe;
    undefined field_0x5ff;
    undefined field_0x600;
    undefined field_0x601;
    undefined field_0x602;
    undefined field_0x603;
    undefined field_0x604;
    undefined field_0x605;
    undefined field_0x606;
    undefined field_0x607;
    undefined field_0x608;
    undefined field_0x609;
    undefined field_0x60a;
    undefined field_0x60b;
    undefined field_0x60c;
    undefined field_0x60d;
    undefined field_0x60e;
    undefined field_0x60f;
    undefined field_0x610;
    undefined field_0x611;
    undefined field_0x612;
    undefined field_0x613;
    undefined field_0x614;
    undefined field_0x615;
    undefined field_0x616;
    undefined field_0x617;
    undefined field_0x618;
    undefined field_0x619;
    undefined field_0x61a;
    undefined field_0x61b;
    undefined field_0x61c;
    undefined field_0x61d;
    undefined field_0x61e;
    undefined field_0x61f;
    undefined field_0x620;
    undefined field_0x621;
    undefined field_0x622;
    undefined field_0x623;
    undefined field_0x624;
    undefined field_0x625;
    undefined field_0x626;
    undefined field_0x627;
    undefined field_0x628;
    undefined field_0x629;
    undefined field_0x62a;
    undefined field_0x62b;
    undefined field_0x62c;
    undefined field_0x62d;
    undefined field_0x62e;
    undefined field_0x62f;
    undefined field_0x630;
    undefined field_0x631;
    undefined field_0x632;
    undefined field_0x633;
    undefined field_0x634;
    undefined field_0x635;
    undefined field_0x636;
    undefined field_0x637;
    undefined field_0x638;
    undefined field_0x639;
    undefined field_0x63a;
    undefined field_0x63b;
    undefined field_0x63c;
    undefined field_0x63d;
    undefined field_0x63e;
    undefined field_0x63f;
    undefined field_0x640;
    undefined field_0x641;
    undefined field_0x642;
    undefined field_0x643;
    undefined field_0x644;
    undefined field_0x645;
    undefined field_0x646;
    undefined field_0x647;
    undefined field_0x648;
    undefined field_0x649;
    undefined field_0x64a;
    undefined field_0x64b;
    undefined field_0x64c;
    undefined field_0x64d;
    undefined field_0x64e;
    undefined field_0x64f;
    undefined field_0x650;
    undefined field_0x651;
    undefined field_0x652;
    undefined field_0x653;
    undefined field_0x654;
    undefined field_0x655;
    undefined field_0x656;
    undefined field_0x657;
    undefined field_0x658;
    undefined field_0x659;
    undefined field_0x65a;
    undefined field_0x65b;
    undefined field_0x65c;
    undefined field_0x65d;
    undefined field_0x65e;
    undefined field_0x65f;
    undefined field_0x660;
    undefined field_0x661;
    undefined field_0x662;
    undefined field_0x663;
    undefined field_0x664;
    undefined field_0x665;
    undefined field_0x666;
    undefined field_0x667;
    undefined field_0x668;
    undefined field_0x669;
    undefined field_0x66a;
    undefined field_0x66b;
    undefined field_0x66c;
    undefined field_0x66d;
    undefined field_0x66e;
    undefined field_0x66f;
    undefined field_0x670;
    undefined field_0x671;
    undefined field_0x672;
    undefined field_0x673;
    undefined field_0x674;
    undefined field_0x675;
    undefined field_0x676;
    undefined field_0x677;
    undefined field_0x678;
    undefined field_0x679;
    undefined field_0x67a;
    undefined field_0x67b;
    undefined field_0x67c;
    undefined field_0x67d;
    undefined field_0x67e;
    undefined field_0x67f;
    undefined field_0x680;
    undefined field_0x681;
    undefined field_0x682;
    undefined field_0x683;
    undefined field_0x684;
    undefined field_0x685;
    undefined field_0x686;
    undefined field_0x687;
    undefined field_0x688;
    undefined field_0x689;
    undefined field_0x68a;
    undefined field_0x68b;
    undefined field_0x68c;
    undefined field_0x68d;
    undefined field_0x68e;
    undefined field_0x68f;
    undefined field_0x690;
    undefined field_0x691;
    undefined field_0x692;
    undefined field_0x693;
    undefined field_0x694;
    undefined field_0x695;
    undefined field_0x696;
    undefined field_0x697;
    undefined field_0x698;
    undefined field_0x699;
    undefined field_0x69a;
    undefined field_0x69b;
    undefined field_0x69c;
    undefined field_0x69d;
    undefined field_0x69e;
    undefined field_0x69f;
    undefined field_0x6a0;
    undefined field_0x6a1;
    undefined field_0x6a2;
    undefined field_0x6a3;
    undefined field_0x6a4;
    undefined field_0x6a5;
    undefined field_0x6a6;
    undefined field_0x6a7;
    undefined field_0x6a8;
    undefined field_0x6a9;
    undefined field_0x6aa;
    undefined field_0x6ab;
    undefined field_0x6ac;
    undefined field_0x6ad;
    undefined field_0x6ae;
    undefined field_0x6af;
    undefined field_0x6b0;
    undefined field_0x6b1;
    undefined field_0x6b2;
    undefined field_0x6b3;
    undefined field_0x6b4;
    undefined field_0x6b5;
    undefined field_0x6b6;
    undefined field_0x6b7;
    undefined field_0x6b8;
    undefined field_0x6b9;
    undefined field_0x6ba;
    undefined field_0x6bb;
    undefined field_0x6bc;
    undefined field_0x6bd;
    undefined field_0x6be;
    undefined field_0x6bf;
    undefined field_0x6c0;
    undefined field_0x6c1;
    undefined field_0x6c2;
    undefined field_0x6c3;
    undefined field_0x6c4;
    undefined field_0x6c5;
    undefined field_0x6c6;
    undefined field_0x6c7;
    undefined field_0x6c8;
    undefined field_0x6c9;
    undefined field_0x6ca;
    undefined field_0x6cb;
    undefined field_0x6cc;
    undefined field_0x6cd;
    undefined field_0x6ce;
    undefined field_0x6cf;
    undefined field_0x6d0;
    undefined field_0x6d1;
    undefined field_0x6d2;
    undefined field_0x6d3;
    undefined field_0x6d4;
    undefined field_0x6d5;
    undefined field_0x6d6;
    undefined field_0x6d7;
    undefined field_0x6d8;
    undefined field_0x6d9;
    undefined field_0x6da;
    undefined field_0x6db;
    undefined field_0x6dc;
    undefined field_0x6dd;
    undefined field_0x6de;
    undefined field_0x6df;
    undefined field_0x6e0;
    undefined field_0x6e1;
    undefined field_0x6e2;
    undefined field_0x6e3;
    undefined field_0x6e4;
    undefined field_0x6e5;
    undefined field_0x6e6;
    undefined field_0x6e7;
    undefined field_0x6e8;
    undefined field_0x6e9;
    undefined field_0x6ea;
    undefined field_0x6eb;
    undefined field_0x6ec;
    undefined field_0x6ed;
    undefined field_0x6ee;
    undefined field_0x6ef;
    undefined field_0x6f0;
    undefined field_0x6f1;
    undefined field_0x6f2;
    undefined field_0x6f3;
    undefined field_0x6f4;
    undefined field_0x6f5;
    undefined field_0x6f6;
    undefined field_0x6f7;
    undefined field_0x6f8;
    undefined field_0x6f9;
    undefined field_0x6fa;
    undefined field_0x6fb;
    undefined field_0x6fc;
    undefined field_0x6fd;
    undefined field_0x6fe;
    undefined field_0x6ff;
    undefined field_0x700;
    undefined field_0x701;
    undefined field_0x702;
    undefined field_0x703;
    undefined field_0x704;
    undefined field_0x705;
    undefined field_0x706;
    undefined field_0x707;
    undefined field_0x708;
    undefined field_0x709;
    undefined field_0x70a;
    undefined field_0x70b;
    undefined field_0x70c;
    undefined field_0x70d;
    undefined field_0x70e;
    undefined field_0x70f;
    undefined field_0x710;
    undefined field_0x711;
    undefined field_0x712;
    undefined field_0x713;
    undefined field_0x714;
    undefined field_0x715;
    undefined field_0x716;
    undefined field_0x717;
    struct WEAPON_PLAYER_LIST * weapons[22]; /* Created by retype action */
    undefined field_0x770;
    undefined field_0x771;
    undefined field_0x772;
    undefined field_0x773;
    undefined field_0x774;
    undefined field_0x775;
    undefined field_0x776;
    undefined field_0x777;
    undefined field_0x778;
    undefined field_0x779;
    undefined field_0x77a;
    undefined field_0x77b;
    undefined field_0x77c;
    undefined field_0x77d;
    undefined field_0x77e;
    undefined field_0x77f;
    undefined field_0x780;
    undefined field_0x781;
    undefined field_0x782;
    undefined field_0x783;
    undefined field_0x784;
    undefined field_0x785;
    undefined field_0x786;
    undefined field_0x787;
    short count; /* Created by retype action */
};

struct Sprite {
    uint id;
    undefined field_0x4;
    undefined field_0x5;
    undefined field_0x6;
    undefined field_0x7;
    undefined field_0x8;
    undefined field_0x9;
    undefined field_0xa;
    undefined field_0xb;
    undefined field_0xc;
    undefined field_0xd;
    undefined field_0xe;
    undefined field_0xf;
    undefined field_0x10;
    undefined field_0x11;
    undefined field_0x12;
    undefined field_0x13;
    undefined field_0x14;
    undefined field_0x15;
    undefined field_0x16;
    undefined field_0x17;
    undefined field_0x18;
    undefined field_0x19;
    undefined field_0x1a;
    undefined field_0x1b;
    undefined field_0x1c;
    undefined field_0x1d;
    undefined field_0x1e;
    undefined field_0x1f;
    undefined field_0x20;
    undefined field_0x21;
    undefined field_0x22;
    undefined field_0x23;
    ushort maybe_id;
    undefined field_0x26;
    undefined field_0x27;
    undefined field_0x28;
    undefined field_0x29;
    undefined field_0x2a;
    undefined field_0x2b;
    undefined field_0x2c;
    undefined field_0x2d;
    undefined field_0x2e;
    undefined field_0x2f;
    undefined field_0x30;
    undefined field_0x31;
    undefined field_0x32;
    undefined field_0x33;
    undefined field_0x34;
    undefined field_0x35;
    undefined field_0x36;
    undefined field_0x37;
    undefined field_0x38;
    undefined field_0x39;
    undefined field_0x3a;
    undefined field_0x3b;
    undefined field_0x3c;
    undefined field_0x3d;
    undefined field_0x3e;
    undefined field_0x3f;
    short field_0x40;
    undefined field_0x42;
    undefined field_0x43;
    undefined field_0x44;
    undefined field_0x45;
    undefined field_0x46;
    undefined field_0x47;
    undefined field_0x48;
    undefined field_0x49;
    undefined field_0x4a;
    undefined field_0x4b;
    undefined field_0x4c;
    undefined field_0x4d;
    undefined field_0x4e;
    undefined field_0x4f;
    undefined field_0x50;
    undefined field_0x51;
    undefined field_0x52;
    undefined field_0x53;
    undefined field_0x54;
    undefined field_0x55;
    undefined field_0x56;
    undefined field_0x57;
    undefined field_0x58;
    undefined field_0x59;
    undefined field_0x5a;
    undefined field_0x5b;
    undefined field_0x5c;
    undefined field_0x5d;
    undefined field_0x5e;
    undefined field_0x5f;
    undefined field_0x60;
    undefined field_0x61;
    undefined field_0x62;
    undefined field_0x63;
    undefined field_0x64;
    undefined field_0x65;
    undefined field_0x66;
    undefined field_0x67;
    undefined field_0x68;
    undefined field_0x69;
    undefined field_0x6a;
    undefined field_0x6b;
    undefined field_0x6c;
    undefined field_0x6d;
    undefined field_0x6e;
    undefined field_0x6f;
    undefined field_0x70;
    undefined field_0x71;
    undefined field_0x72;
    undefined field_0x73;
    undefined field_0x74;
    undefined field_0x75;
    undefined field_0x76;
    undefined field_0x77;
    struct Sprite * maybeNext;
    undefined field_0x7c;
    undefined field_0x7d;
    undefined field_0x7e;
    undefined field_0x7f;
    struct Position * actualPosition;
    undefined field_0x84;
    undefined field_0x85;
    undefined field_0x86;
    undefined field_0x87;
    undefined field_0x88;
    undefined field_0x89;
    undefined field_0x8a;
    undefined field_0x8b;
    undefined field_0x8c;
    undefined field_0x8d;
    undefined field_0x8e;
    undefined field_0x8f;
    undefined field_0x90;
    undefined field_0x91;
    undefined field_0x92;
    undefined field_0x93;
    undefined field_0x94;
    undefined field_0x95;
    undefined field_0x96;
    undefined field_0x97;
    undefined field_0x98;
    undefined field_0x99;
    undefined field_0x9a;
    undefined field_0x9b;
    undefined field_0x9c;
    undefined field_0x9d;
    undefined field_0x9e;
    undefined field_0x9f;
    undefined field_0xa0;
    undefined field_0xa1;
    undefined field_0xa2;
    undefined field_0xa3;
    undefined field_0xa4;
    undefined field_0xa5;
    undefined field_0xa6;
    undefined field_0xa7;
    undefined field_0xa8;
    undefined field_0xa9;
    undefined field_0xaa;
    undefined field_0xab;
    undefined field_0xac;
    undefined field_0xad;
    undefined field_0xae;
    undefined field_0xaf;
    undefined field_0xb0;
    undefined field_0xb1;
    undefined field_0xb2;
    undefined field_0xb3;
    undefined field_0xb4;
    undefined field_0xb5;
    undefined field_0xb6;
    undefined field_0xb7;
    undefined field_0xb8;
    undefined field_0xb9;
    undefined field_0xba;
    undefined field_0xbb;
    undefined field_0xbc;
    undefined field_0xbd;
    undefined field_0xbe;
    undefined field_0xbf;
    undefined field_0xc0;
    undefined field_0xc1;
    undefined field_0xc2;
    undefined field_0xc3;
    undefined field_0xc4;
    undefined field_0xc5;
    undefined field_0xc6;
    undefined field_0xc7;
    undefined field_0xc8;
    undefined field_0xc9;
    undefined field_0xca;
    undefined field_0xcb;
    undefined field_0xcc;
    undefined field_0xcd;
    undefined field_0xce;
    undefined field_0xcf;
    undefined field_0xd0;
    undefined field_0xd1;
    undefined field_0xd2;
    undefined field_0xd3;
    undefined field_0xd4;
    undefined field_0xd5;
    undefined field_0xd6;
    undefined field_0xd7;
    undefined field_0xd8;
    undefined field_0xd9;
    undefined field_0xda;
    undefined field_0xdb;
    undefined field_0xdc;
    undefined field_0xdd;
    undefined field_0xde;
    undefined field_0xdf;
    undefined field_0xe0;
    undefined field_0xe1;
    undefined field_0xe2;
    undefined field_0xe3;
    undefined field_0xe4;
    undefined field_0xe5;
    undefined field_0xe6;
    undefined field_0xe7;
    undefined field_0xe8;
    undefined field_0xe9;
    undefined field_0xea;
    undefined field_0xeb;
    undefined field_0xec;
    undefined field_0xed;
    undefined field_0xee;
    undefined field_0xef;
    undefined field_0xf0;
    undefined field_0xf1;
    undefined field_0xf2;
    undefined field_0xf3;
    undefined field_0xf4;
    undefined field_0xf5;
    undefined field_0xf6;
    undefined field_0xf7;
    undefined field_0xf8;
    undefined field_0xf9;
    undefined field_0xfa;
    undefined field_0xfb;
    undefined field_0xfc;
    undefined field_0xfd;
    undefined field_0xfe;
    undefined field_0xff;
};

struct Car {
    undefined field_0x0;
    undefined field_0x1;
    undefined field_0x2;
    undefined field_0x3;
    undefined field_0x4;
    undefined field_0x5;
    undefined field_0x6;
    undefined field_0x7;
    enum CAR_LIGHTS_AND_DOORS_BITSTATE carLights;
    undefined field_0xc;
    undefined field_0xd;
    undefined field_0xe;
    undefined field_0xf;
    undefined field_0x10;
    undefined field_0x11;
    undefined field_0x12;
    undefined field_0x13;
    undefined field_0x14;
    undefined field_0x15;
    undefined field_0x16;
    undefined field_0x17;
    undefined field_0x18;
    undefined field_0x19;
    undefined field_0x1a;
    undefined field_0x1b;
    undefined field_0x1c;
    undefined field_0x1d;
    undefined field_0x1e;
    undefined field_0x1f;
    undefined field_0x20;
    undefined field_0x21;
    undefined field_0x22;
    undefined field_0x23;
    uint bitMask2;
    undefined field_0x28;
    undefined field_0x29;
    undefined field_0x2a;
    undefined field_0x2b;
    undefined field_0x2c;
    undefined field_0x2d;
    undefined field_0x2e;
    undefined field_0x2f;
    undefined field_0x30;
    undefined field_0x31;
    undefined field_0x32;
    undefined field_0x33;
    undefined field_0x34;
    undefined field_0x35;
    undefined field_0x36;
    undefined field_0x37;
    undefined field_0x38;
    undefined field_0x39;
    undefined field_0x3a;
    undefined field_0x3b;
    int field_0x3c;
    undefined field_0x40;
    undefined field_0x41;
    undefined field_0x42;
    undefined field_0x43;
    undefined field_0x44;
    undefined field_0x45;
    undefined field_0x46;
    undefined field_0x47;
    undefined field_0x48;
    undefined field_0x49;
    undefined field_0x4a;
    undefined field_0x4b;
    int field_0x4c;
    struct Position * position;
    struct Ped * driver; /* Created by retype action */
    struct MaybeCarEngine * maybeEngine;
    undefined field_0x5c;
    undefined field_0x5d;
    undefined field_0x5e;
    undefined field_0x5f;
    undefined field_0x60;
    undefined field_0x61;
    undefined field_0x62;
    undefined field_0x63;
    void * field_0x64;
    undefined field_0x68;
    undefined field_0x69;
    undefined field_0x6a;
    undefined field_0x6b;
    undefined field_0x6c;
    undefined field_0x6d;
    undefined field_0x6e;
    undefined field_0x6f;
    int driverPedId; /* Created by retype action */
    undefined field_0x74;
    byte carDamagePercent;
    undefined field_0x76;
    undefined field_0x77;
    byte bitMask;
    undefined field_0x79;
    undefined field_0x7a;
    undefined field_0x7b;
    int field_0x7c;
    bool field_0x80;
    undefined field_0x81;
    undefined field_0x82;
    undefined field_0x83;
    enum CAR_MODEL carModel;
    undefined field_0x85;
    undefined field_0x86;
    undefined field_0x87;
    int field_0x88;
    undefined field_0x8c;
    undefined field_0x8d;
    undefined field_0x8e;
    undefined field_0x8f;
    undefined field_0x90;
    undefined field_0x91;
    undefined field_0x92;
    undefined field_0x93;
    undefined field_0x94;
    undefined field_0x95;
    undefined field_0x96;
    undefined field_0x97;
    byte locksDoor; /* 1 - locked, 2 - unlocked */
    undefined field_0x99;
    undefined field_0x9a;
    undefined field_0x9b;
    enum CAR_ENGINE_STATE engineState;
    undefined field_0xa0;
    undefined field_0xa1;
    undefined field_0xa2;
    undefined field_0xa3;
    enum CAR_SIREN_STATE sirenState;
    undefined field_0xa5;
    undefined field_0xa6;
    enum HORN horn;
};

struct Position {
    short rotation;
    undefined field_0x2;
    undefined field_0x3;
    struct Position * prev;
    int field_0x8;
    struct Position * next;
    int field_0x10;
    int x; /* Created by retype action */
    int y; /* Created by retype action */
    int z; /* Created by retype action */
    short incFromS20;
    short field_0x22;
    short field_0x24;
    undefined field_0x26;
    undefined field_0x27;
    int field_0x28;
    byte field_0x2c;
    undefined field_0x2d;
    undefined field_0x2e;
    undefined field_0x2f;
    int field_0x30;
    int field_0x34;
    byte field_0x38;
    byte field_0x39;
    undefined field_0x3a;
    undefined field_0x3b;
};

struct WEAPON_STRUCT {
    short ammo;
    byte timeToReload;
    undefined field_0x3;
    int field_0x4;
    undefined field_0x8;
    undefined field_0x9;
    undefined field_0xa;
    undefined field_0xb;
    undefined field_0xc;
    undefined field_0xd;
    undefined field_0xe;
    undefined field_0xf;
    undefined field_0x10;
    undefined field_0x11;
    undefined field_0x12;
    undefined field_0x13;
    int carId; /* Created by retype action */
    struct WEAPON_STRUCT * nextWeapon;
    enum WEAPON_INDEX id;
    undefined field_0x20;
    undefined field_0x21;
    undefined field_0x22;
    undefined field_0x23;
    struct Ped * ped;
    undefined field_0x28;
    undefined field_0x29;
    undefined field_0x2a;
    undefined field_0x2b;
    byte field_0x2c;
    undefined field_0x2d;
    undefined field_0x2e;
    undefined field_0x2f;
};

struct MaybeCarEngine {
    undefined field_0x0;
    undefined field_0x1;
    undefined field_0x2;
    undefined field_0x3;
    undefined field_0x4;
    undefined field_0x5;
    undefined field_0x6;
    undefined field_0x7;
    undefined field_0x8;
    undefined field_0x9;
    undefined field_0xa;
    undefined field_0xb;
    struct MaybeCarEngine * next;
    int field_0x10[2][4];
    undefined field_0x30;
    undefined field_0x31;
    undefined field_0x32;
    undefined field_0x33;
    undefined field_0x34;
    undefined field_0x35;
    undefined field_0x36;
    undefined field_0x37;
    undefined field_0x38;
    undefined field_0x39;
    undefined field_0x3a;
    undefined field_0x3b;
    undefined field_0x3c;
    undefined field_0x3d;
    undefined field_0x3e;
    undefined field_0x3f;
    undefined field_0x40;
    undefined field_0x41;
    undefined field_0x42;
    undefined field_0x43;
    undefined field_0x44;
    undefined field_0x45;
    undefined field_0x46;
    undefined field_0x47;
    undefined field_0x48;
    undefined field_0x49;
    undefined field_0x4a;
    undefined field_0x4b;
    undefined field_0x4c;
    undefined field_0x4d;
    undefined field_0x4e;
    undefined field_0x4f;
    undefined field_0x50;
    undefined field_0x51;
    undefined field_0x52;
    undefined field_0x53;
    undefined field_0x54;
    undefined field_0x55;
    undefined field_0x56;
    undefined field_0x57;
    undefined field_0x58;
    undefined field_0x59;
    undefined field_0x5a;
    undefined field_0x5b;
    void * prev;
    undefined field_0x60;
    undefined field_0x61;
    undefined field_0x62;
    undefined field_0x63;
    undefined field_0x64;
    undefined field_0x65;
    undefined field_0x66;
    undefined field_0x67;
    undefined field_0x68;
    undefined field_0x69;
    undefined field_0x6a;
    undefined field_0x6b;
    undefined field_0x6c;
    undefined field_0x6d;
    undefined field_0x6e;
    undefined field_0x6f;
    undefined field_0x70;
    undefined field_0x71;
    undefined field_0x72;
    undefined field_0x73;
    undefined field_0x74;
    undefined field_0x75;
    undefined field_0x76;
    undefined field_0x77;
    undefined field_0x78;
    undefined field_0x79;
    undefined field_0x7a;
    undefined field_0x7b;
    undefined field_0x7c;
    undefined field_0x7d;
    undefined field_0x7e;
    undefined field_0x7f;
    undefined field_0x80;
    undefined field_0x81;
    undefined field_0x82;
    undefined field_0x83;
    undefined field_0x84;
    undefined field_0x85;
    undefined field_0x86;
    undefined field_0x87;
    undefined field_0x88;
    undefined field_0x89;
    undefined field_0x8a;
    undefined field_0x8b;
    undefined field_0x8c;
    undefined field_0x8d;
    undefined field_0x8e;
    undefined field_0x8f;
    undefined field_0x90;
    undefined field_0x91;
    byte field_0x92;
    bool IsAccelerateForward;
    bool IsAccelerateBackward;
    undefined field_0x95;
    undefined field_0x96;
    undefined field_0x97;
    undefined field_0x98;
    undefined field_0x99;
    undefined field_0x9a;
    undefined field_0x9b;
    undefined field_0x9c;
    undefined field_0x9d;
    undefined field_0x9e;
    undefined field_0x9f;
    undefined field_0xa0;
    undefined field_0xa1;
    undefined field_0xa2;
    undefined field_0xa3;
    undefined field_0xa4;
    undefined field_0xa5;
    undefined field_0xa6;
    undefined field_0xa7;
    undefined field_0xa8;
    undefined field_0xa9;
    undefined field_0xaa;
    undefined field_0xab;
    undefined field_0xac;
    undefined field_0xad;
    undefined field_0xae;
    undefined field_0xaf;
};

struct Ped {
    byte field_0x0;
    byte field_0x1;
    undefined field_0x2;
    undefined field_0x3;
    undefined field_0x4;
    undefined field_0x5;
    undefined field_0x6;
    undefined field_0x7;
    undefined field_0x8;
    undefined field_0x9;
    undefined field_0xa;
    undefined field_0xb;
    undefined field_0xc;
    undefined field_0xd;
    undefined field_0xe;
    undefined field_0xf;
    undefined field_0x10;
    undefined field_0x11;
    undefined field_0x12;
    undefined field_0x13;
    undefined field_0x14;
    undefined field_0x15;
    undefined field_0x16;
    undefined field_0x17;
    undefined field_0x18;
    undefined field_0x19;
    undefined field_0x1a;
    undefined field_0x1b;
    undefined field_0x1c;
    undefined field_0x1d;
    undefined field_0x1e;
    undefined field_0x1f;
    undefined field_0x20;
    undefined field_0x21;
    undefined field_0x22;
    undefined field_0x23;
    undefined field_0x24;
    undefined field_0x25;
    undefined field_0x26;
    undefined field_0x27;
    undefined field_0x28;
    undefined field_0x29;
    undefined field_0x2a;
    undefined field_0x2b;
    struct Ped * elvisSomething;
    undefined field_0x30;
    undefined field_0x31;
    undefined field_0x32;
    undefined field_0x33;
    undefined field_0x34;
    undefined field_0x35;
    undefined field_0x36;
    undefined field_0x37;
    undefined field_0x38;
    undefined field_0x39;
    undefined field_0x3a;
    undefined field_0x3b;
    undefined field_0x3c;
    undefined field_0x3d;
    undefined field_0x3e;
    undefined field_0x3f;
    undefined field_0x40;
    undefined field_0x41;
    undefined field_0x42;
    undefined field_0x43;
    undefined field_0x44;
    undefined field_0x45;
    undefined field_0x46;
    undefined field_0x47;
    undefined field_0x48;
    undefined field_0x49;
    undefined field_0x4a;
    undefined field_0x4b;
    undefined field_0x4c;
    undefined field_0x4d;
    undefined field_0x4e;
    undefined field_0x4f;
    undefined field_0x50;
    undefined field_0x51;
    undefined field_0x52;
    undefined field_0x53;
    undefined field_0x54;
    undefined field_0x55;
    undefined field_0x56;
    undefined field_0x57;
    undefined field_0x58;
    undefined field_0x59;
    undefined field_0x5a;
    undefined field_0x5b;
    undefined field_0x5c;
    undefined field_0x5d;
    undefined field_0x5e;
    undefined field_0x5f;
    undefined field_0x60;
    undefined field_0x61;
    undefined field_0x62;
    undefined field_0x63;
    undefined field_0x64;
    undefined field_0x65;
    undefined field_0x66;
    undefined field_0x67;
    undefined field_0x68;
    undefined field_0x69;
    undefined field_0x6a;
    undefined field_0x6b;
    undefined field_0x6c;
    undefined field_0x6d;
    undefined field_0x6e;
    undefined field_0x6f;
    undefined field_0x70;
    undefined field_0x71;
    undefined field_0x72;
    undefined field_0x73;
    undefined field_0x74;
    undefined field_0x75;
    undefined field_0x76;
    undefined field_0x77;
    undefined field_0x78;
    undefined field_0x79;
    undefined field_0x7a;
    undefined field_0x7b;
    undefined field_0x7c;
    undefined field_0x7d;
    undefined field_0x7e;
    undefined field_0x7f;
    undefined field_0x80;
    undefined field_0x81;
    undefined field_0x82;
    undefined field_0x83;
    undefined field_0x84;
    undefined field_0x85;
    undefined field_0x86;
    undefined field_0x87;
    undefined field_0x88;
    undefined field_0x89;
    undefined field_0x8a;
    undefined field_0x8b;
    undefined field_0x8c;
    undefined field_0x8d;
    undefined field_0x8e;
    undefined field_0x8f;
    undefined field_0x90;
    undefined field_0x91;
    undefined field_0x92;
    undefined field_0x93;
    undefined field_0x94;
    undefined field_0x95;
    undefined field_0x96;
    undefined field_0x97;
    undefined field_0x98;
    undefined field_0x99;
    undefined field_0x9a;
    undefined field_0x9b;
    undefined field_0x9c;
    undefined field_0x9d;
    undefined field_0x9e;
    undefined field_0x9f;
    undefined field_0xa0;
    undefined field_0xa1;
    undefined field_0xa2;
    undefined field_0xa3;
    undefined field_0xa4;
    undefined field_0xa5;
    undefined field_0xa6;
    undefined field_0xa7;
    undefined field_0xa8;
    undefined field_0xa9;
    undefined field_0xaa;
    undefined field_0xab;
    undefined field_0xac;
    undefined field_0xad;
    undefined field_0xae;
    undefined field_0xaf;
    undefined field_0xb0;
    undefined field_0xb1;
    undefined field_0xb2;
    undefined field_0xb3;
    undefined field_0xb4;
    undefined field_0xb5;
    undefined field_0xb6;
    undefined field_0xb7;
    undefined field_0xb8;
    undefined field_0xb9;
    undefined field_0xba;
    undefined field_0xbb;
    undefined field_0xbc;
    undefined field_0xbd;
    undefined field_0xbe;
    undefined field_0xbf;
    undefined field_0xc0;
    undefined field_0xc1;
    undefined field_0xc2;
    undefined field_0xc3;
    undefined field_0xc4;
    undefined field_0xc5;
    undefined field_0xc6;
    undefined field_0xc7;
    undefined field_0xc8;
    undefined field_0xc9;
    undefined field_0xca;
    undefined field_0xcb;
    undefined field_0xcc;
    undefined field_0xcd;
    undefined field_0xce;
    undefined field_0xcf;
    undefined field_0xd0;
    undefined field_0xd1;
    undefined field_0xd2;
    undefined field_0xd3;
    undefined field_0xd4;
    undefined field_0xd5;
    undefined field_0xd6;
    undefined field_0xd7;
    undefined field_0xd8;
    undefined field_0xd9;
    undefined field_0xda;
    undefined field_0xdb;
    undefined field_0xdc;
    undefined field_0xdd;
    undefined field_0xde;
    undefined field_0xdf;
    undefined field_0xe0;
    undefined field_0xe1;
    undefined field_0xe2;
    undefined field_0xe3;
    undefined field_0xe4;
    undefined field_0xe5;
    undefined field_0xe6;
    undefined field_0xe7;
    undefined field_0xe8;
    undefined field_0xe9;
    undefined field_0xea;
    undefined field_0xeb;
    undefined field_0xec;
    undefined field_0xed;
    undefined field_0xee;
    undefined field_0xef;
    undefined field_0xf0;
    undefined field_0xf1;
    undefined field_0xf2;
    undefined field_0xf3;
    undefined field_0xf4;
    undefined field_0xf5;
    undefined field_0xf6;
    undefined field_0xf7;
    undefined field_0xf8;
    undefined field_0xf9;
    undefined field_0xfa;
    undefined field_0xfb;
    undefined field_0xfc;
    undefined field_0xfd;
    undefined field_0xfe;
    undefined field_0xff;
    undefined field_0x100;
    undefined field_0x101;
    undefined field_0x102;
    undefined field_0x103;
    undefined field_0x104;
    undefined field_0x105;
    undefined field_0x106;
    undefined field_0x107;
    undefined field_0x108;
    undefined field_0x109;
    undefined field_0x10a;
    undefined field_0x10b;
    undefined field_0x10c;
    undefined field_0x10d;
    undefined field_0x10e;
    undefined field_0x10f;
    undefined field_0x110;
    undefined field_0x111;
    undefined field_0x112;
    undefined field_0x113;
    undefined field_0x114;
    undefined field_0x115;
    undefined field_0x116;
    undefined field_0x117;
    undefined field_0x118;
    undefined field_0x119;
    undefined field_0x11a;
    undefined field_0x11b;
    undefined field_0x11c;
    undefined field_0x11d;
    undefined field_0x11e;
    undefined field_0x11f;
    undefined field_0x120;
    undefined field_0x121;
    undefined field_0x122;
    undefined field_0x123;
    undefined field_0x124;
    undefined field_0x125;
    undefined field_0x126;
    undefined field_0x127;
    undefined field_0x128;
    undefined field_0x129;
    undefined field_0x12a;
    undefined field_0x12b;
    short field_0x12c;
    short field_0x12e;
    short field_0x130;
    undefined field_0x132;
    undefined field_0x133;
    short field_0x134;
    undefined field_0x136;
    undefined field_0x137;
    undefined field_0x138;
    undefined field_0x139;
    undefined field_0x13a;
    undefined field_0x13b;
    undefined field_0x13c;
    undefined field_0x13d;
    undefined field_0x13e;
    undefined field_0x13f;
    int field_0x140;
    int field_0x144;
    int field_0x148;
    int field_0x14c;
    int field_0x150;
    struct Car * field_0x154;
    int field_0x158;
    struct WEAPON_PLAYER_LIST * playerWeapons;
    struct Ped * nextPed;
    struct Ped * ElvisOrTarget; /* Created by retype action */
    struct Sprite * pedSprite;
    struct Car * currentCar;
    struct WEAPON_STRUCT * selectedWeapon;
    void * ptrToWeapon;
    int field_0x178;
    int field_0x17c;
    int field_0x180;
    undefined field_0x184;
    undefined field_0x185;
    undefined field_0x186;
    undefined field_0x187;
    undefined field_0x188;
    undefined field_0x189;
    undefined field_0x18a;
    undefined field_0x18b;
    int field_0x18c;
    int field_0x190;
    int field_0x194;
    undefined field_0x198;
    undefined field_0x199;
    undefined field_0x19a;
    undefined field_0x19b;
    undefined field_0x19c;
    undefined field_0x19d;
    undefined field_0x19e;
    undefined field_0x19f;
    undefined field_0x1a0;
    undefined field_0x1a1;
    undefined field_0x1a2;
    undefined field_0x1a3;
    int field_0x1a4;
    struct Ped * elvisLeader;
    int x;
    int y;
    int z;
    struct Ped * field_0x1b8;
    struct Ped * field_0x1bc;
    struct Ped * field_0x1c0;
    struct Ped * field_0x1c4;
    struct Ped * field_0x1c8;
    struct Ped * field_0x1cc;
    void * field_0x1d0;
    void * field_0x1d4;
    void * field_0x1d8;
    undefined field_0x1dc;
    undefined field_0x1dd;
    undefined field_0x1de;
    undefined field_0x1df;
    undefined field_0x1e0;
    undefined field_0x1e1;
    undefined field_0x1e2;
    undefined field_0x1e3;
    undefined field_0x1e4;
    undefined field_0x1e5;
    undefined field_0x1e6;
    undefined field_0x1e7;
    undefined field_0x1e8;
    undefined field_0x1e9;
    undefined field_0x1ea;
    undefined field_0x1eb;
    undefined field_0x1ec;
    undefined field_0x1ed;
    undefined field_0x1ee;
    undefined field_0x1ef;
    undefined field_0x1f0;
    undefined field_0x1f1;
    undefined field_0x1f2;
    undefined field_0x1f3;
    undefined field_0x1f4;
    undefined field_0x1f5;
    undefined field_0x1f6;
    undefined field_0x1f7;
    undefined field_0x1f8;
    undefined field_0x1f9;
    undefined field_0x1fa;
    undefined field_0x1fb;
    undefined field_0x1fc;
    undefined field_0x1fd;
    undefined field_0x1fe;
    undefined field_0x1ff;
    int id;
    int field_0x204;
    ushort Invulnerability; /* 9999 = infinity */
    short CopLevel; /* 600 = 1 star, 1600 = 2 */
    short field_0x20c;
    short field_0x20e;
    undefined field_0x210;
    undefined field_0x211;
    undefined field_0x212;
    undefined field_0x213;
    undefined field_0x214;
    undefined field_0x215;
    short health;
    short field_0x218;
    short field_0x21a;
    enum PED_BIT_STATE bitStateInvisOnFireEtc; /* invisibilty, electrofingers on fire and more  */
    undefined field_0x220;
    undefined field_0x221;
    undefined field_0x222;
    undefined field_0x223;
    undefined field_0x224;
    byte field_0x225;
    byte field_0x226;
    byte field_0x227;
    byte field_0x228;
    undefined field_0x229;
    undefined field_0x22a;
    undefined field_0x22b;
    int field_0x22c;
    int field_0x230;
    byte eq99;
    undefined field_0x235;
    undefined field_0x236;
    undefined field_0x237;
    uint bitState2;
    byte field_0x23c;
    undefined field_0x23d;
    undefined field_0x23e;
    undefined field_0x23f;
    enum OCUPATION occupation;
    byte field_0x244;
    undefined field_0x245;
    undefined field_0x246;
    undefined field_0x247;
    int field_0x248;
    byte field_0x24c;
    undefined field_0x24d;
    undefined field_0x24e;
    undefined field_0x24f;
    undefined field_0x250;
    undefined field_0x251;
    undefined field_0x252;
    undefined field_0x253;
    undefined field_0x254;
    undefined field_0x255;
    undefined field_0x256;
    undefined field_0x257;
    int field_0x258;
    int field_0x25c;
    undefined field_0x260;
    byte field_0x261;
    byte field_0x262;
    byte field_0x263;
    byte field_0x264;
    byte field_0x265;
    undefined field_0x266;
    undefined field_0x267;
    undefined field_0x268;
    undefined field_0x269;
    undefined field_0x26a;
    undefined field_0x26b;
    int field_0x26c;
    int field_0x270;
    undefined field_0x274;
    undefined field_0x275;
    undefined field_0x276;
    undefined field_0x277;
    enum PED_STATE state;
    enum PED_STATE2 state2;
    enum PED_STATE state1_2; /* 0 on start, 3 when getting to a car */
    enum PED_STATE2 state2_2;
    int field_0x288;
    int field_0x28c;
    int relToMultiplayer;
};



]]

ffi.cdef[[
int __cdecl HelloFFI(int, int, int);

typedef Ped* (__stdcall GetPedById)(int);

typedef enum GAME_STATUS {
    GAME_PAUSED=2,
    GAME_RUN=1
} GAME_STATUS;

typedef struct {
    enum GAME_STATUS gameStatus;
    void * slots[6];
    int alsoCurrentSlot;
    char field_0x20;
    char slotIndex;
    int field_0x24;
    int field_0x28;
    int field_0x2c;
    void * currentSlot;
} Game;

]]

local pGame = ffi.cast( "Game**", 0x005eb4fc )
local pGetPedById = ffi.cast("GetPedById*", 0x0043ae10)


function api.GetGameStatus()
	log(tostring(pGame))
	log(tostring(pGame[0]))
	if pGame[0] == nil then
		return 0, "GAME_NOT_STARTED"
	elseif pGame[0].gameStatus == 1 then
		return 1, "GAME_RUN"
	else
		return 2, "GAME_PAUSED"
	end
end

function api.SetGameStatus( status )
	if status ~= 1 and status ~= 2 then
		return
	end
	if api.GetGameStatus() ~= 0 then
		pGame[0].gameStatus = status
	end
end

function api.GetNextPedId()
	local p = ffi.cast("int*", 0x00591e84)
	return p[0]
end

function api.IncrByNextPedId( incr )
	local p = ffi.cast("int*", 0x00591e84)
	p[0] = p[0] + incr
	return p[0];
end

function api.GetPedById( id )
	log("api.GetPedById( " .. tostring(id) .. ") " .. tostring(pGetPedById))
    if pGame[0] == nil then
	    return 0, "GAME_NOT_STARTED"
    end
	local ped = pGetPedById(id)
	return ped
end

local user_gbh_BeginScene = nil

function api.HookBeginScene( fn )
	user_gbh_BeginScene = fn
end


function gbh_BeginScene( dt )
	if(user_gbh_BeginScene) then
        user_gbh_BeginScene(dt)
        return true
    end
    return false
end

return api