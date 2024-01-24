ô1
O/Users/samboers/development/order_management_system/OcelotApiGateway/Program.cs
	namespace 	
OcelotApiGateway
 
{ 
public 

class 
Program 
{ 
public 
static 
async 
Task  
Main! %
(% &
string& ,
[, -
]- .
args/ 3
)3 4
{ 	
var 
host 
= 
new 
WebHostBuilder )
() *
)* +
. 

UseKestrel 
( 
) 
. 
UseContentRoot 
(  
	Directory  )
.) *
GetCurrentDirectory* =
(= >
)> ?
)? @
. %
ConfigureAppConfiguration *
(* +
(+ ,
hostingContext, :
,: ;
config< B
)B C
=>D F
{ 
config 
. 
SetBasePath $
($ %
hostingContext% 3
.3 4
HostingEnvironment4 F
.F G
ContentRootPathG V
)V W
. 
AddJsonFile $
($ %
$str% 7
,7 8
true9 =
,= >
true? C
)C D
. 
AddJsonFile $
($ %
$"% '
$str' 3
{3 4
hostingContext4 B
.B C
HostingEnvironmentC U
.U V
EnvironmentNameV e
}e f
$strf k
"k l
,l m
truen r
,r s
truet x
)x y
. 
AddJsonFile $
($ %
$str% 2
)2 3
. #
AddEnvironmentVariables 0
(0 1
)1 2
;2 3
} 
) 
. 
ConfigureServices "
(" #
(# $
hostingContext$ 2
,2 3
services4 <
)< =
=>> @
{ 
IConfiguration   "
configuration  # 0
=  1 2
hostingContext  3 A
.  A B
Configuration  B O
;  O P
services"" 
."" 
AddCors"" $
(""$ %
options""% ,
=>""- /
{## 
options$$ 
.$$  
	AddPolicy$$  )
($$) *
$str$$* 6
,$$6 7
builder%% #
=>%%$ &
builder%%' .
.&&  !
WithOrigins&&! ,
(&&, -
$str&&- D
,&&D E
$str&&F ]
)&&] ^
.''  !
AllowAnyMethod''! /
(''/ 0
)''0 1
.((  !
AllowAnyHeader((! /
(((/ 0
)((0 1
.))  !
AllowCredentials))! 1
())1 2
)))2 3
)))3 4
;))4 5
}** 
)** 
;** 
services,, 
.,, 
	AddOcelot,, &
(,,& '
),,' (
;,,( )
services// 
.// 
AddAuthentication// .
(//. /
options/// 6
=>//7 9
{00 
options11 
.11  %
DefaultAuthenticateScheme11  9
=11: ;
JwtBearerDefaults11< M
.11M N 
AuthenticationScheme11N b
;11b c
options22 
.22  "
DefaultChallengeScheme22  6
=227 8
JwtBearerDefaults229 J
.22J K 
AuthenticationScheme22K _
;22_ `
options33 
.33  
DefaultScheme33  -
=33. /
JwtBearerDefaults330 A
.33A B 
AuthenticationScheme33B V
;33V W
}44 
)44 
.55 
AddJwtBearer55 !
(55! "
options55" )
=>55* ,
{66 
options77 
.77  
	SaveToken77  )
=77* +
true77, 0
;770 1
options88 
.88   
RequireHttpsMetadata88  4
=885 6
false887 <
;88< =
options99 
.99  %
TokenValidationParameters99  9
=99: ;
new99< ?%
TokenValidationParameters99@ Y
(99Y Z
)99Z [
{:: 
ValidateIssuer;; *
=;;+ ,
true;;- 1
,;;1 2
ValidateAudience<< ,
=<<- .
true<</ 3
,<<3 4
ValidAudience== )
===* +
configuration==, 9
[==9 :
$str==: T
]==T U
,==U V
ValidIssuer>> '
=>>( )
configuration>>* 7
[>>7 8
$str>>8 P
]>>P Q
,>>Q R
IssuerSigningKey?? ,
=??- .
new??/ 2 
SymmetricSecurityKey??3 G
(??G H
Encoding??H P
.??P Q
UTF8??Q U
.??U V
GetBytes??V ^
(??^ _
configuration??_ l
[??l m
$str	??m €
]
??€ 
)
?? ‚
)
??‚ ƒ
}@@ 
;@@ 
}AA 
)AA 
;AA 
}BB 
)BB 
.CC 
ConfigureLoggingCC !
(CC! "
(CC" #
hostingContextCC# 1
,CC1 2
loggingCC3 :
)CC: ;
=>CC< >
{DD 
}FF 
)FF 
.GG 
UseIISIntegrationGG "
(GG" #
)GG# $
.HH 
	ConfigureHH 
(HH 
appHH 
=>HH !
{II 
appJJ 
.JJ 
UseCorsJJ 
(JJ  
$strJJ  ,
)JJ, -
;JJ- .
appKK 
.KK 

UseRoutingKK "
(KK" #
)KK# $
;KK$ %
appNN 
.NN 
UseAuthenticationNN )
(NN) *
)NN* +
;NN+ ,
appOO 
.OO 
UseAuthorizationOO (
(OO( )
)OO) *
;OO* +
appRR 
.RR 
	UseOcelotRR !
(RR! "
)RR" #
.RR# $
WaitRR$ (
(RR( )
)RR) *
;RR* +
}SS 
)SS 
.TT 
BuildTT 
(TT 
)TT 
;TT 
hostVV 
.VV 
RunVV 
(VV 
)VV 
;VV 
}WW 	
}XX 
}YY 