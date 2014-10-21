/*
	B2B Taxi thrift IDL file.
*/

/*
	Namespaces
*/
namespace cpp	taxi
namespace java	ru.car4b.thrift
namespace perl	taxi
namespace d	taxi
namespace php	taxi

/*
	Domains
*/
typedef	binary	BLOB
typedef	i64	DATE
typedef	i64	ID
typedef	i32	TAG
typedef	i32	NUMBER32
typedef	double	GEO
typedef	string	STR
typedef	string	LINK

typedef	string	MAILTO
typedef	string	FAX
typedef	string	TEL
typedef	double	CURR

typedef list<ID> IDs

enum Month
{
	JAN		=	0,
	FEB		=	1,
	MAR		=	2,
	APR		=	3,
	MAY		=	4,
	JUN		=	5,
	JUL		=	6,
	AUG		=	7,
	SEP		=	8,
	OCT		=	9,
	NOV		=	10,
	DEC		=	11
}

/*
	���� ������������ ��������� �����������. ����������� ����� ����� ��������� �������. ������ ���� ������ �������� ����. ������ ������ �����������.
	
*/
enum OrgBuilding
{
	OFFICEMAIN	=	0,	// �������� ���� (���� [����������������] �������������)
	FACILITY	=	1	// �������, �������� �������, ������
}

/*
	��� ����� ����������� �� ������� �������� � �����������. ���� � ��� �� ������ ����� ����� 
	������ �� ��� �������� � ������� �������������.
*/
enum OrgServiceDept
{
	CUSTOMER	=	0,	// ��� ����������� ������
	DRIVER		=	1,	// ��� �������� � ����������
	OTHER		=	2	// ��� �������� � ������� �������������
}

/*
	���� ����������� � �������������� ������
*/
enum OrgRole
{
	ORGGUEST	=	0,		//	������������� ������
	ORGSERVICE	=	1,		//	������ (�����)
	ORGTAXI		=	2,		//	������������� ������
	ORGCUSTOMER	=	3,		//	������
	ORGBANK		=	4,		//	����
	ORGPROCESSOR	=	5		//	���, ���������� ����
}

/*
	���� ���.���� �����: ������ � ������������� ������
*/
enum TaxiServiceRole
{
	TS_DISPATCH	=	0,		//	������������� ������ (��)
	TS_CARPOOL	=	1		//	������ ������ ����� (����������)
}

/*
	���� ������������� � �������
*/
enum PersonRole 
{
	ADMIN		=	0		//	�� ������������, ������
	MANAGER		=	1,		//	��������� ��� ��������� ������
	CUSTOMER	=	2,		//	������
	DISPATCHER	=	3,		//	���������
	DRIVER		=	4,		//	��������, ��
	MASTER		=	5,		//	�������� ���������
	OPERATOR	=	6,		//	Customer+Passenger
	PASSENGER	=	7,		//	������������
	GUEST		=	8,		//	web user, ���� �� ����������
	NOTAUTHORIZED	=	9,		//	� ������ �������, �� �����������
}

/*
	���� ������������� � �����������- ��� ������� ������������ CHIEF � ������� ACCT
	��� ��������- �������� (MGR)
	��� ��������� ����������� SELFEMP
*/
enum OrgPosition
{
	SELFEMP		=	0,		//	�����������, ��������
	EMP		=	1,		//	���������
	CHIEF		=	2,		//	������������
	ACCT		=	3,		//	�������
	MGR		=	4		//	���������
}

/*
	���� ������������� � ������: 
		- ������������ (��������, ����� ���� ������ ���������)
		- ��� ������� (������� ����� ���� � ���, ���� ��� ���� ��������, �� ����������)
*/
enum OrderRole
{
	ORDER_FOR	=	0,		//	�������� ��� (������������)
	ORDER_BY	=	1		//	��� ��������
}

/*
	������:
		- ��������, �� �� ������
		- �������
*/
enum CrewRole
{
	CREW_DRIVER	=	0,		//	����� ������
	CREW_LOADER	=	1		//	�������
}

/*
	������ ��, �����������, ��� �������
*/
enum OrgAddressType
{
	OA_REPORT	=	0,		//	����� ��� ����������
	OA_LEGAL	=	1,		//	����� �����������
	OA_REAL		=	2		//	����� �����������
}

typedef map<OrgAddressType, STR> OrgAddress

/*
	���� ���������
*/
enum DeviceType 
{
	UNKNOWN		=	0		//	�� ���������
	ANDROID		=	1,		//	Android
	IOS		=	2,		//	������, �� ������������
	JAVAME		=	3,		//	���������, �� ������������
	MOBILEBROWSER	=	4,		//	������� � ������
	DESKTOPBROWSER	=	5,		//	�������
	APPSERVICE	=	6		//	������
}

enum EmployeeStatus
{
	ACTIVE		=	1,		//	�����������
	INACTIVE	=	2,		//	�� ����������� (� �������)
	DELETED		=	3		// 	������
}

enum VehicleStatus
{
	ACTIVE		=	1,		//	�������� 
	INACTIVE	=	2		//	����������
}

enum DocumentType
{
	PASSPORT	=	1,		//	�������
	DRIVERLICENSE	=	2,		//	���.�������������
	ACT		=	3,		//	���
	BILL		=	4,		//	����
	RECEIPT		=	5,		//	���������
	WAYBILL		=	6,		//	������� ����
	ENTLICENSE	=	7,		//	�������� ���������������
	PAYMENTRECEIPT	=	8,		//	��������� �� ������
}

/*
	����� ������ ��������
*/
enum CanOrder
{
	EVERYTHING	=	1,		//	�����������
	NOTHING		=	2,		//	�� �����������
	ONLYROUTE	=	3		// 	������ �� ��������
}

enum CabClass
{
	ECONOMY		=	1,		//	������
	COMFORT		=	2,		//	�������
	PREMIUM		=	3		// 	�������
}

/*
	��� ������ �� �������
*/
enum OrderTimeType
{
	URGENT		=	1,		//	�������
	SPECIFIEDTIME	=	2,		// 	��������������� � ����� ��������� ����� � ������� �����
	EVERYDAY	=	3		//	��������������� � ����� ��������� ����� ��������� � �������� ��� ������
}

enum OrderFeature
{
	CHILDSEAT	=	1,		//	������� ������
	LOADER		=	2		//	�������
}

typedef	set<OrderFeature>  OrderFeatures

enum OrderStage
{
	ORDERNEW	=	0,		//	����� �� ���������
	ORDERACCEPT	=	1,		//	����� ������
	ORDERDECLINED	=	2,		//	����� ���������
	ORDERASSIGN	=	3,		//	������ ������� ���������� �������� ������������, �� �� ������� �������������
	ORDERASSIGNED	=	4,		//	������� ������������� �� ��������, ����� ������
	ORDERCONFIRMED	=	5,		//	������������ ���������� � �������� ��������, ������������� ���������
	ORDERDRIVING	=	6,		//	�������� ��������� � ���������� ������ (������ � ������������)
	ORDERWAITING	=	7,		//	������ �� ����� ����������, ������� ������������
	ORDERTRANSPORTING=	8,		//	����� ������������ � ����� ����������
	ORDERSTOP	=	9,		//	��������� ���������
	ORDERCOMPLETE	=	10,		//	����� ��������
	ORDERCANCELLED	=	11,		//	����� ������� �������������
	ORDERFAILED	=	12		//	����� ������� ���������
}

enum PaymentState
{
	READY		=	0,		//	��������� ����, ��� �� ��������
	PAID		=	1,		//	��������
	UNPAID		=	2		//	������ ��������� ����������
}

enum ClaimState
{
	CLAIMNO		=	0,		// ����� ���
	CLAIM		=	1,		// ���� ������
	CLAIMCLOSED	=	2		// ������ �������
}

/*
	tax
*/
enum TaxType
{
	TAXORG		=	1,		//	��. ����, �����������
	TAXPERSON	=	2,		//	��
	TAXFARMER	=	3,		//	������������ (����������) ���������
	TAXLAWYER	=	4,		//	�������
	TAXNOTARY	=	5		//	��������
}

/*
	organization type
*/
enum OrgType
{
	ORGGOV		=	1,		//	����������������� �����������
	ORGCOMM		=	2,		//	��������������� �����������
	ORGENTERPRISE	=	3,		//	������������� �����������
	ORGFARMER	=	4,		//	������������ (����������) ���������
	ORGOTHER	=	5		//	������ �����������
}

enum OrderType
{
	TAXI		=	1,
	COURIER		=	2
}

enum VehicleType
{
	CAR		=	1,
	COURIER		=	2
}

enum VehicleClass
{
	VEHICLE_SMALL1	=	1,		//	����� �����
	VEHICLE_SMALL2	=	2,		//	�����
	VEHICLE_MIDDLE1	=	3,		//	������ �������
	VEHICLE_MIDDLE2	=	4,		//	�������
	VEHICLE_MIDDLE3	=	5,		//	������ �������
	VEHICLE_SUPER	=	6,		//	������
	VEHICLE_CROSS	=	7,		//	���������
	VEHICLE_VAN	=	8,		//	�������
	VEHICLE_COUPE	=	9		//	����
}

enum VehicleCategory
{
	VEHICLE_CAR	=	1,		//	�������� ����
	VEHICLE_BIKE	=	2,		//	���� ���������
	VEHICLE_SPEC	=	3,		//	�����������
	VEHICLE_TRAILER	=	4,		//	������
	VEHICLE_TRUCK	=	5,		//	�������� ���������
	VEHICLE_BUS	=	6,		//	�������
}

enum StopType
{
	STOP_WAIT	=	1,		//	�������� ������� � �������
	STOP_PICKUP	=	2,		//	������� ���������
	STOP_THROW	=	3,		//	������� ���������
	STOP_LOAD	=	4,		//	����� �����
	STOP_UNLOAD	=	5		//	����� �����
}

enum DeclineOrderCause
{
	DECLINE_BY_DRIVER	=	0,
	DECLINE_BY_SERVICE	=	1,
	DECLINE_BY_PASSENGER	=	2,
}

enum BankRole
{
	BANK_ACCOUNT	=	0
}

enum ErrorType
{
	ERR_FATAL	=	0,		//	�� � ����
	ERR_BACKEND	=	1,		//	����
	ERR_NOT_FOUND	=	2,		//	��� ������� � ��������� ���������������� ��� ��������������� ���������� �������
	ERR_APP		=	3,		//	App service
	ERR_TOKEN_EXPIRED=	4,		//	����� ���������
	ERR_LOGIN	=	5		//	�������� �����/������
}

enum DictTag
{
	TAG_VEHICLE_COLOR	=	1,		//	����
	TAG_VEHICLE_BRAND	=	2,		//	�����
	TAG_VEHICLE_MODEL	=	3,		//	������
}

struct RowRange
{
	1:	ID start,
	2:	NUMBER32 len
}

struct DateRange
{
	1:	DATE start,
	2:	DATE finish
}

struct GeoLocation
{
	1:	GEO latitude,				//	������
	2:	GEO longitude				//	�������
}

struct City
{
	1:	ID id,					//	������������� �������� �������
	2:	ID areaid,				//	������������� ���.��.
	3:	NUMBER32 tag,				//	����� 
	4:	STR name,				//	�������� ������
	5:	STR notes,				//	��������
	6:	GeoLocation geolocation,		//	�������������
}

typedef list<City> Cities
typedef ID Cityid
typedef list<Cityid> Cityids

struct DictEntry
{
	1:	ID id,					//	������������� �������� �������
	2:	ID parent,				//	������������� ������������� �������� �������
	3:	DictTag tag,				//	�������
	4:	NUMBER32 idx,				//	������ �������� �������
	5:	STR strvalue,				//	��������� �������� �������� �������
	6:	i64 intvalue				//	�������� �������� �������� �������
}

typedef	list<DictEntry>  DictEntries

struct PassengerLimit
{
	1:	ID id,					//	�������������
	2:	NUMBER32 tripcount,
	3:	NUMBER32 minutescount,
	4:	NUMBER32 moneycount,
}


typedef	map<Month, PassengerLimit>  PassengerLimitMonth

struct Payload
{
	1:	NUMBER32 passengercount,		//	����� ����������, ���.
	2:	NUMBER32 baggagecount,		//	����� ���� ������, ��. ���� �� ����
	3:	NUMBER32 baggageweight,		//	��� ������, ��.
	4:	NUMBER32 baggagewidth,		//	������ ���� ���� ������
	5:	NUMBER32 baggageheight,		//	������ ���� ���� ������
	6:	NUMBER32 papercount,			//	����� ������ (��������������) (���������������� ������������, ���������� ��������) ���� ��� ����
	7:	NUMBER32 stopcount			//	����� ����������� ��������� ��� ������� �� ��������
}

struct PassengerUsage
{
	1:	ID id,					//	�������������
	2:	NUMBER32 tripcount,
	3:	NUMBER32 minutescount,
	4:	NUMBER32 moneycount,
	5:	Payload payload,			//	����, ���������, ���������� ������
}

typedef	map<Month, PassengerUsage>  PassengerUsageMonth
typedef	map<NUMBER32, PassengerUsage>  PassengerUsageYear

/*
	User device is used to grant access.
*/
struct UserDevice 
{
	1:	DeviceType devicetype,			//	Device type
	2:	STR model,				//	Phone model
	3:	STR imei,				//	IMEI
	4:	STR line1,				//	first E.164 phone number, e.g. +7(914)111-2222 -> 7914111222
	5:	STR line2,				//	second E.164 phone number, e.g. +7(914)111-2222 -> 7914111222
	6:	bool hasGSMorCDMA,			//	�������� �� ��� �����
	7:	bool hasGPS,				//	���������� �� GPS
	8:	bool isGPS,				//	���������� �� GPS ��������
	9:	GeoLocation geolocation,
}

typedef list<UserDevice> UserDevices

enum ServiceObject
{
	SO_Unknown			=	0,
	SO_AutoPayment			=	1,
	SO_Bank				=	2,
	SO_BillAct			=	3,
	SO_City				=	4,
	SO_Claim			=	5,
	SO_Credentials			=	6,
	SO_Customer			=	7,
	SO_CustomerStatistic		=	8,
	SO_DateRange			=	9,
	SO_Dept				=	10,
	SO_DictEntry			=	11,
	SO_Dispatcher			=	12,
	SO_Document			=	13,
	SO_Driver			=	14,
	SO_DriverBlackList		=	15,
	SO_GeoLocation			=	16,
	SO_Location			=	17,
	SO_Manager			=	18,
	SO_Notification			=	19,
	SO_NotificationEvent		=	20,
	SO_Org				=	21,
	SO_OrgService			=	22,
	SO_Passenger			=	23,
	SO_PassengerLimit		=	24,
	SO_PassengerUsage		=	25,
	SO_Payload			=	26,
	SO_Payment			=	27,
	SO_Person			=	28,
	SO_Rate				=	29,
	SO_RowRange			=	30,
	SO_ServiceObjectAction		=	31,
	SO_ServiceOrder			=	32,
	SO_ServiceOrderDecline		=	33,
	SO_ServiceOrderStop		=	34,
	SO_Shedule			=	35,
	SO_SheduleDays			=	36,
	SO_SheduleStop			=	37,
	SO_TariffPlan			=	38,
	SO_Track			=	39,
	SO_UserDevice 			=	40,
	SO_Vehicle			=	41,
}

enum ServiceAction
{
	ACT_GET		=	0,
	ACT_ADD		=	1,
	ACT_EDIT	=	2,
	ACT_RM		=	3,
	ACT_DO		=	4,
}

typedef map<ServiceAction, bool> ServiceActionPermit
typedef map<ServiceObject, ServiceActionPermit> ServiceObjectActionPermit

struct Credentials 
{
	1:	STR phone,				//	normalized E.164 phone number, e.g. +7(914)111-2222 -> 7914111222
	2:	PersonRole personrole = PersonRole.NOTAUTHORIZED, 	//	assigned by service
	3:	STR token,				//	security token, assigned by service, not used
	4:	STR password, 				//	password assigned by service
	5:	ServiceAction serviceaction,
	6:	ServiceObject serviceobject,
	7:	bool islogged,
	8:	DATE timelogon,
	9:	STR gcmregistrationid			//	Google Cloud Messaging for Android registration id, see https://developer.android.com/google/gcm/gcm.html
}

struct Person
{
	1:	ID id,
	2:	Credentials credentials,
	3:	UserDevices userdevices, 
	4:	TAG tag,
	5:	STR firstname,
	6:	STR lastname,
	7:	STR middlename,
	8:	STR prefix,
	9:	DATE birthdate,
	10:	STR deparment,
	11:	STR position,
	12:	STR note,
	13:	TEL phone1,
	14:	TEL phone2,
	15:	FAX fax,
	16:	MAILTO email,
	17:	LINK photo
}

typedef ID Personid
/*
	���������� �����������
*/
typedef map<OrgPosition, Person> OrgPositionPerson

/*
	���������� �����������, ����������� � ������������� ������� ��� ����������
*/
typedef list<Person> OrderStopPersons

struct Bank
{
	1:	ID id,
	2:	STR bik,				//	���
	3:	STR name				//	�������� �����
}

typedef ID Bankid
typedef map<BankRole, Bankid> OrgBank
typedef list<Bankid> Bankids
typedef list<Bank> Banks

/*
	����� ��������
*/
struct Location
{
	1:	GeoLocation location,			//	������, �������
	2:	STR name,
	3:	ID cityid,				//	�����
	4:	STR city,				//	�������������� �������� ������
	5:	STR address
}

typedef map<OrgBuilding, Location> OrgLocation

struct Org
{
	1:	ID id,			//	�������������
	2:	OrgRole orgrole,	//	���� ����������� � ��
	3:	OrgType orgtype,	//	��� �����������
	4:	DATE start,		//	������ ������ � �������� ��� ������ ������ �������
	5:	NUMBER32 tag,
	6:	STR name,		//	�������� �����������
	7:	STR fullname,		//	������ ��������
	8:	STR shortname,		//	������� ��������, ������������
	9:	STR inn,		//	���
	10:	STR kpp,		//	���
	11:	STR ogrn,		//	����
	12:	OrgAddress orgaddress,	//	������ ��� ����������, �����������, �����������
	13:	TEL phone,		//	�������
	14:	MAILTO email,		//	E-mail
	15:	OrgPositionPerson employee,//	������������, ������� ���������
	16:	OrgBank bank,		//	����
	27:	STR currentaccount,	//	��������� ����
	28:	STR correspondentaccount,//	����/����
	29:	OrgLocation orglocation,//	������������ ������ ����� � ��������������� ���������
	30:	STR description,  	//	�������
	31:	STR note		//	����������
}

typedef ID Orgid
typedef list<Org> Orgs
typedef list<Org> Orgids
/*
	Department
*/
struct Dept
{
	1:	ID id,
	2:	Orgid orgid,		//	���� ����������� � ��
	3:	STR name,		//	�������� �������������
	4:	STR fullname,		//	������ ��������
	5:	STR shortname,		//	������� ��������, ������������
	6:	OrgAddress orgaddress,	//	������ ��� ����������, �����������, �����������
	7:	TEL phone,		//	�������
	8:	MAILTO email,		//	E-mail
	9:	OrgPositionPerson employee,	//	������������, ������� ���������
	10:	OrgBank bank,		//	����
	11:	STR currentaccount,	//	��������� ����
	12:	STR correspondentaccount,//	����/����
	13:	OrgLocation orglocation,//	main office location
	14:	STR description,	//	��������
	15:	STR note		//	����������
}

typedef map<OrgServiceDept, Orgid> OrgServiceDepts
/*
	taxi service
*/
struct OrgService
{
	1:	ID id,				//	�������������
	2:	OrgServiceDepts organization,	//	�����������
	3:	STR name,
	4:	OrgLocation orglocation		//	downtown location
}

typedef list <OrgService> OrgServices
typedef ID OrgServiceid
typedef map <TaxiServiceRole, OrgServiceid> RoleOrgService

struct Customer
{
	1:	ID id,			//	�/�
	2:	ID cityid,		//	�����, ��� ��������� ������, ��������� RoleOrgService
	3:	STR nickname,		//	���������� ��� ��� ������
	4:	TAG tag,		//	��� (������)
	5:	OrgServiceDepts organization,	//	�����������
	6:	RoleOrgService svc,	//	�������������� ������ (��������� � ������, � ����������� ��������- ��� ��������)
	7:	ID dispatcherid,	//	������������ ���������
	8:	TaxType taxtype,	//	���������������
	9:	bool active,		//	false: ������� ����������
	10:	bool enabled,		//	false: ������������ �������������� (�������������,...)	
	11:	ID tariffplanid,	//	�������� ����
	12:	bool haspreferreddriver,//	���� �������������� ��������
	13:	ID preferreddriverid,	//	ID ��������������� ��������. �� ��������, � ID!
	14:	bool hascredit,		//	����� � ������
	15:	bool hascreditlimit,	//	�� � �������
	16:	CURR creditlimit,	//	������ ������ � ������
}

struct CustomerStatistic
{
	1:	ID id,			//	�/�
	2:	ID cityid,		//	�����, ��� ��������� ������, ��������� customerid
	3:	ID customerid,		//	���������� ��� ��� ������
	4:	TAG tag,		//	��� (������)
	5:	bool enabled,		//	false: �� �������� � ������
	6:	CURR currentbalance,	//	��������� ������ �������� �����
	7:	PassengerUsageMonth usagemonth,	//	���������� �� �������
	8:	PassengerUsageYear usageyear,	//	���������� �� �����
}

typedef list <Customer> Customers
typedef ID Customerid
typedef list <Customerid> Customerids

struct Passenger
{
	1:	ID id,				//	Passenger Id
	2:	ID cityid,			//	�����, ��� ������ ��������� ��������
	3:	ID customerid,			//	#��������
	4:	NUMBER32 tag,			//	���
	5:	bool isoperator,		//	�������� ����������
	6:	bool isvip,			//	������� ������� ��������
	7:	EmployeeStatus status,		//	����������� ������������ ���������
	8:	Person person,			//	������������ (��������, ��������) ����� ���� � ���������� ������������. ���������������� �� ������ ��������.
	9:	CanOrder canorder,		//
	10:	PassengerLimitMonth limitmonth,	// ������ � �����
	11:	PassengerUsageMonth usagemonth	// ���������� ����������� �������� � �����
}

typedef ID Passengerid
typedef list <Passenger> Passengers
typedef list <Passengerid> Passengerids

struct Vehicle
{
	1: ID id,
	2: VehicleType vehicletype = VehicleType.CAR,	// ������ �������� ���������� ��� ������
	3: VehicleCategory vehiclecategory,	//	��������� ��
	4: VehicleClass vehicleclass,		//	����� ���� � ���������
	5: VehicleStatus vehiclestatus,		//	��������� �������� � technicalcondition
	6: ID vehiclebrandid,			//	DictEntry �������������
	7: ID vehiclemodel,			//	DictEntry ������, ������������� �� �������������
	8: ID color,				//	DictEntry ����
	9: NUMBER32 year,				//	��� �������
	10: STR plate,				//	��������������� �����
	11: NUMBER32 platenumber,			//	��� ����� ��� ����
	12: STR technicalcondition,		//	����������� ���������
	13: NUMBER32 passengercount,			//	�����������, ����������
	14: bool childseat,			//	������� ������
	15: bool checkers,			//	�����
	16: bool stickers,			//	��������
	17: bool lantern,			//	������
	18: LINK photo,				//	����
	19: STR vin				//	����������������� ����� ��
}
          
typedef ID Vehicleid
typedef list<Vehicleid> Vehicleids
typedef list<Vehicle> Vehicles

struct Document
{
	1:	ID id,			//	document Id
	2:	STR ser,		//	�����
	3:	STR number,		//	�����
	4:	STR issuer,		//	��� �����
	5:	DATE issued,		//	����� �����
	6:	DATE validity,		//	����������� ��
	7:	STR category,		//	���������(�)
	8:	NUMBER32 expirience		//	����

}

typedef ID Documentid
typedef map<DocumentType, Documentid> DocumentMap

struct Manager
{
	1:	ID id,			//	Dispatcher Id
	2:	ID cityid,		//	�����, ��� ������ ��������� �������� (��������� RoleOrgService)
	3:	RoleOrgService svc,	//	������ (��������� � ������, � ����������� ��������- ��� ��������)
	4:	EmployeeStatus status,	//	����������� ������������ ���������
	5:	Person person,		//	was OrgPositionPerson ���, �������
	6:	DocumentMap license,	//	����� ���� ����� �� ���������
	7:	STR nickname,		//	���
	8:	bool online,		//	�������� �� �����
	9:	bool isadmin,		//	�������������

}

typedef ID Managerid
typedef list<Manager> Managers
typedef list<Managerid> Managerids

struct Driver
{
	1:	ID id,			//	Driver Id
	2:	ID cityid,		//	�����, ��� ������ ��������� �������� (��������� RoleOrgService)
	3:	RoleOrgService svc,	//	������ (��������� � ������, � ����������� ��������- ��� ��������)
	4:	GeoLocation geolocation,//	��������� ����������
	5:	DATE updated,		//	�����, ����� ��������� ��� ������������ ����������
	6:	ID serviceorderid,	//	0 - ��������, ����� ����� ������
	7:	EmployeeStatus status,	//	����������� ������������ ���������
	8:	Person person,		//	was OrgPositionPerson ���, ����
	9:	DocumentMap license,	//	���. �������������, ���. ����
	10:	STR nickname,		//	���
	11:	NUMBER32 callsign,	//	�������� �����
	12:	CabClass cabclass,	//	����� �������
	13:	NUMBER32 rating,	//	������� (�����)
	14:	bool online,		//	�������� �� �����
	15:	bool ismaster,		//	��������
	16:	Vehicleids vehicleids	//	������� ����������, ������������ ��������� ��� �������� �����
}

typedef ID Driverid
typedef list<Driver> Drivers
typedef list<Driverid> Driverids

/*
	Driver �������� ����� ������, ������� �������������
*/
struct DriverOnline
{
	1:	Driverid driverid,		//	� ��������
	2:	GeoLocation geolocation,	//	���������
	3:	ID serviceorderid,		//	0 - ��������
}

typedef map <Driverid, DriverOnline> DriverOnlineMap
typedef map<Cityid, DriverOnlineMap> CityDriverOnlineMap
typedef list<DriverOnline> DriverOnlines

struct Dispatcher
{
	1:	ID id,			//	Dispatcher Id
	2:	RoleOrgService svc,	//	������ (��������� � ������, � ����������� ��������- ��� ��������)
	3:	EmployeeStatus status,	//	����������� ������������ ���������
	4:	Person person,		//	was OrgPositionPerson ���, �������
	5:	DocumentMap license,	//	����� ���� ����� �� ���������
	6:	STR nickname,		//	���
	7:	bool online,		//	��������� �� �����
}

/*
	������
*/
typedef map<CrewRole, Driverid> Crew

typedef ID Serviceorderid

struct ServiceOrderStop
{
	1:	ID id,			//	����� ���������
	2:	Serviceorderid serviceorderid,	//	#������
	3:	NUMBER32 stopno,		//	���������� ����� ���������
	4:	StopType stoptype,	//	��� ���������: �����, ��������, ������
	5:	OrderStopPersons pickuppersons,//	���� ��������- ����� ����������� ��� ���� ������ (������)
	6:	Payload payload,	//	��������
	7:	OrderStage stage,	//	������ ���������� ������ (��������, �������� ���� �����)
	8:	DATE created,		//	����� ����������� ������
	9:	DATE assigned,		//	����� ���������� ��������
	10:	DATE started,		// 	�����, ����� �������� ����� ���������� ������ (��������)
	11:	DATE arrived,		// 	�����, ����� �������� ������ � ��������� �����
	12:	DATE finished,		//	�����, ����� �������� �������� ���������� ������ (������� ��� ���)
	13:	STR notes		//	�������
}

typedef ID ServiceOrderStopid
typedef list<ServiceOrderStopid> ServiceOrderStopids
typedef list<ServiceOrderStop> ServiceOrderStops

typedef ID Sheduleid

struct ServiceOrder
{
	1:	ID id,			//	����� �����
	2:	ID cityid,		//	�����, ��������� RoleOrgService
	3:	NUMBER32 tag		//	��������� ��� ����� (��� �����)
	4:	OrderType ordertype,	//	��� ������: �����, ������
	5:	OrderTimeType ordertimetype,//	��� ������ �� �������
	6:	OrderFeatures orderfeatures,//	�������������� ����: ������, � �.�.
	7:	RoleOrgService svc,	//	������ (� ����� ������, ��� ����)
	8:	ID dispatcherid,	//	� ���������� � ����������� ����������
	9:	Personid	passengerid,	//  passenger person
	10:	Sheduleid	sheduleid,	// != 0 shedule identifier
	11:	Passengerids passengers,	//	��������� ������������ ������� (����� ���� ������, ��� ���������)
	12:	ServiceOrderStopids stops,//	������������� ���������
	13:	Payload payload,	//	��������
	14:	OrderStage stage,	//	������ ���������� ������ (��������, �������� ���� �����)
	15:	Crew crew,		//	��������, ����, ������� ����� � ����������� ����������, �������
	16:	DATE created,		//	����� ����������� ������
	17:	DATE sheduletime,	//	�����, ����� ���� ������ ������ (���� ordertimetype != OrderTimeType::URGENT)
	18:	DATE assigned,		//	����� ���������� ��������
	19:	DATE started,		// 	�����, ����� �������� ����� ���������� ������ (��������)
	20:	DATE arrived,		// 	�����, ����� �������� ������ � ��������� �����
	21:	DATE finished,		//	�����, ����� �������� �������� ���������� ������ (������� ��� ���)
	22:	Location locstart,
	23:	Location locfinish,
	24:	ID preferreddriverid,	//	ID ��������������� �������� � ���������� � �������������� ���������� (������ �������). �� ��������, � ID!
	25:	NUMBER32 totaltimefiscal,	//	������ ����� � ���� � ������� "�� ��������"
	26:	NUMBER32 totaltimeactual,	//	������ ����� � ���� � �������, ������������ ���������
	27:	CURR sumfiscal,		//	����� "�� ��������"
	28:	CURR sumactual,		//	����� � ������ (������������ ��������� � ������� � ������ ������ � ��.)
	29:	CabClass cabclass,	//	����� �������
	30:	PaymentState paymentstate,
	31:	ClaimState claimstate,	//	������ ����, ���, �������
	32:	bool hasstops,		//	���� ������������� ��������� ��� ����� �������� (������ ���������� ��������)
	33:	STR notes		//	�������
}

typedef ID ServiceOrderid
typedef list<ServiceOrderid> ServiceOrderids
typedef list<ServiceOrder> ServiceOrders


/*
	����� �������� �� ������ ��� ������������� ����� �����
*/
struct ServiceOrderDecline
{
	1:	ID id,				//	�������������
	2:	Serviceorderid serviceorderid,	//	#�����
	3:	DATE declinetime,		//	����� ������ (��� ����������)
	4:	Driverid driverid,		//	#��������
	5:	DeclineOrderCause cause,	//	������� ������ �� ������
	6:	STR notes,			//	������� ������ �� ������ �������
}

typedef ID ServiceOrderDeclineid
typedef list<ServiceOrderDeclineid> ServiceOrderDeclineids
typedef list<ServiceOrderDecline> ServiceOrderDeclines

/*
	��������� �� ������ ����� ���������� ���������� �������� � �������������
*/
struct Claim
{
	1:	ID id,					//	�������������
	2:	Serviceorderid serviceorderid,		//	#�����
	3:	PersonRole personrole,			//	��� ������� ��������� � ������
	4:	Driverid driverid,			//	#��������
	5:	DATE claimtime,				//	����� ������ ��� ������ �� ������
	6:	STR notes				//	����� ���������
}

typedef ID Claimid
typedef list<Claimid> Claimids
typedef list<Claim> Claims

/*
	�������. �� ������������.
*/
struct Track
{
	1:	ID id,					//	Identifier
	2:	Driverid driverid,			//	��������
	3:	Serviceorderid serviceorderid,		//	�����
	4:	DATE tracktime,				//	����� 
	5:	GeoLocation location			//	������, �������
}

typedef ID Trackid
typedef list<Trackid> Trackids
typedef list<Track> Tracks

struct SheduleDays
{
	1:	bool week0,				//	Su
	2:	bool week1,				//	Mo
	3:	bool week2,				//	Tu
	4:	bool week3,				//	We
	5:	bool week4,				//	Th
	6:	bool week5,				//	Fr
	7:	bool week6				//	Sa
}

/*
	������ ��������
*/
struct Shedule
{
	1:	ID id,					//	Identifier
	2:	bool active,				//	�������
	3:	SheduleDays sheduledays,		//	��� ������
	4:	ID customerid,				//	#��������
	5:	STR name,
	6:	STR description,
	7:	NUMBER32 tag				//	��������� ��� ����� (��� �����)
	8:	OrderType ordertype,			//	��� ������: �����, ������
	9:	OrderFeatures orderfeatures,		//	�������������� ����: ������, � �.�.
	10:	Location pointstart,			//	�����
	11:	Location pointfinish,			//	�����
	12:	bool hasMiddlePoints,			//	���� ��������� (�������� � ��������� ������ ����������)
	13:	bool haspassenger,			//	���� ����� �������� ������ �� ���������
	14:	Passengerid passengerid,		//	��������� ������ �������� (�������������, � �� ����������� ������)
	15:	Passengerids passengers,		//	������ ��������� ��������� (�������������)
	16:	DATE timestart,				//	��� � ������ ������
	17:	DATE timefinish,			//	��� � ������ ���������
	18:	ID sheduleoperatorid,			//	�������� ��������
	19:	ID preferreddriverid			//	ID ��������������� �������� � ���������� � �������������� ���������� (������ �������). �� ��������, � ID!
}

typedef list<Shedule> Shedules
typedef list<Sheduleid> Sheduleids


/*
	������ ������ ���������
*/
struct DriverBlackList
{
	1:	ID id,					//	Identifier
	2:	DATE created,				//	���� ��������
	3:	ID customerid,				//	#��������
	4:	ID driverid				//	#��������
}

/*
	������������� ��������� �����
*/
struct SheduleStop
{
	1:	ID id,					//	Identifier
	2:	ID sheduleid,				//	���� �������
	3:	Location point,				//	�����
	4:	NUMBER32 position,				//	���������� ����� � �����
	5:	bool haspassenger,			//	���� ����� �������� ������ �� ���������
	6:	ID passengerid				//	��������� �������� (�������������)
}

/*
	�������� �����
*/
struct TariffPlan
{
	1:	ID id,					//	Identifier
	2:	OrgServiceid orgserviceid,		//	������
	3:	ID cityid,				//	�����
	4:	STR name,				//	��������
	5:	STR notes,			//	��������
	6:	bool active,				//	������ ����������. false- �������� �����.
}


typedef ID TariffPlanid
typedef list<TariffPlan> TariffPlans
typedef list<TariffPlanid> TariffPlanids

/*
	������
*/
struct Rate
{
	1:	ID id,					//	Identifier
	2:	ID tariffplanid,			//	�������� ����
	3:	STR name,				//	��������
	4:	bool active,				//	������ ����������. false- �������� �����.
	5:	DATE datestart,				//	������ �������� ������. ���� active: true, ������������!
	6:	DATE datefinish,			//	������ ��������� �������� ������. ���� active: true, ������������!
	7:	bool isweekend,				// 	�� ��������
	8:	bool isday,				// 	�� ������� ���
	9:	NUMBER32 hourstart,			//	������ �������� ������ � ������� ���- ���
	10:	NUMBER32 hourfinish,			//	������ ��������� ������ � ������� ���- ���
	11:	CURR costmin,				//	���. ���������
	12:	CURR priceboarding,			//	�� �������
	13:	CURR priceminute,			//	���� ������
	14:	CURR pricedelay,			//	���� ������ ������� 
	15:	CURR pricewait,				//	���� ������ ��������
	16:	NUMBER32 speedmin,				//	�������� ���� ������� �������
	17:	NUMBER32 timedelayfree			//	���������� ����� �������� � ��������
}

typedef ID Rateid
typedef list<Rate> Rates
typedef list<Rateid> Rateids

/*
	���������� ���������
*/
struct Notification
{
	1:	ID id,					//	Identifier
	2:	bool isactive,				// 	false: ������
	3:	DATE msgtime,				// 	false: ������
	4:	PersonRole msgfrom,			// 	�� �������� ��� �� ����������
	5:	ID driverid,				// 	#Driver ���� ��������, �� ����� ����� �� ������ ��������. �������� ����� �������� ������ ���������.
	6:	bool todriver,				//	���������
	7:	bool tooperator,			//	����������
	8:	bool topassenger,			//	����������
	9:	bool todispatcher,			//	�����������
	10:	STR note				//	�����
}

/*
	����� � ����
*/
struct BillAct
{
	1:	ID id,					//	Identifier
	2:	RoleOrgService orgservice,		// 	��� ��������� ����
	3:	ID customerid,				// 	#��������
	4:	NUMBER32 periodid,			// 	������ �������
	5:	DATE datestart,				// 	�� �������� ��� �� ����������
	6:	DATE datefinish,			// 	���� ��������, �� ����� ����� �� ������ ��������. �������� ����� �������� ������ ���������.
	7:	CURR total0,				//	����� ���������� (��� ������)
	8:	CURR total1,				//	����� �� ������
	9:	CURR total2,				//	� ������
	10:	CURR taxpercent				//	���, %
	11:	CURR tax,				//	���
	12:	bool hasdiscount,			//	���� ������
	13:	DATE created,				//	���� �����������
	14:	bool haspayments,			//	���� ������
	15:	bool paid,				//	������� ���������
	16:	DATE datepaid,				//	���� ��������� ������
	17:	CURR sumbefore,				//	������� ��
	18:	CURR sumafter,				//	������� �����
	19:	STR note				//	�����
	20:	STR billno,				//	����� �����
	21:	STR actno				//	����� ����
}

/*
	������� ��������
*/
struct Payment
{
	1:	ID id,					//	Identifier
	2:	ID billactid,			// 	���� � ���
	3:	DATE datereceived,			// 	���� ���������
	4:	DocumentMap document			// 	��������� (���������, ����, ���)
}

/*
	�������������� ����������� ������
*/
struct AutoPayment
{
	1:	ID id,					//	Identifier
	2:	NUMBER32 periodid,				// 	������ �������
	3:	DATE datestart,				// 	������, ������
	4:	DATE datefinish,			// 	������, ���������
	5:	NUMBER32 state				// 	���� ���������
}

/*
	�������, ��������� ��������
*/
struct NotificationEvent
{
	1:	ID id,					//	Identifier
	2:	PersonRole receiverrole,		//	���� ����������
	3:	STR phone,				//	normalized E.164 phone number, e.g. +7(914)111-2222 -> 7914111222
	4:	PersonRole emitterrole,			//	���� �����������
	5:	ID emitter,				//	Identifier �����������
	6:	ServiceObject serviceobject,		// 	������, ��������� ��������
	7:	ServiceAction serviceaction,		// 	������������ ��������
	8:	DATE datestart,				// 	����� �������, ����� ��������� ��� ���������� � �������
	9:	bool infuture,				// 	����������� ��������
	10:	ID serviceobjectid,			// 	������������� �������, ��������� ��������
	11:	bool sent,				// 	������ ����������
	12:	DATE sentdate,				// 	����� �������, ����� ���������� �����������
	13:	STR notes,				// 	��������� �������
	14:	bool gcmsend,				// 	��������� ����������� driver/passenger
	15:	NUMBER32 gcmsent,			// 	1- ���� ���������� ����������� driver/passenger, >1- �������
	16:	bool isgcmsentsuccess,			// 	���� �� ���������� ������� ����������� driver/passenger
	17:	DATE gcmsentdate,			// 	����� ��������� �������� ���������
	18:	STR gcmresponsecode,			// 	��� ���������� ������ GCM
	19:	STR gcmresponse				// 	��������� ����� GCM (������ JSON ������)
}

typedef list<NotificationEvent> NotificationEvents

/*
	Exception
	errorcode: application code, 0 if not provided
*/
exception ServiceFailure {
	1:	ErrorType errortype,
	2:	NUMBER32 errorcode,			// ��� ������, 0 ���� ���
	3:	STR description				// ����� ������������
}

/*
	������ ���������
*/
service PassengerService
{
	/*
		Get document (for dispatcher only!)
		id: document identifier
	*/
	Document	getDocument(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Get organization(for all registered users)
		id: organization identifier
	*/
	Org	getOrg(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Check credentials, Driver
	*/
	Driver		loginDriver(1:Credentials credentials, 2: UserDevice userdevice) throws(1: ServiceFailure servicefailure),

	/*
		Check credentials, Passenger & Operator
	*/
	Passenger	loginPassenger(1:Credentials credentials, 2: UserDevice userdevice) throws(1: ServiceFailure servicefailure),

	/*
		List of dictionary
		value: search criteria
	*/
	DictEntries	findDictEntry(1:Credentials credentials, 2: UserDevice userdevice, 3: DictEntry search, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of dictionary of specified tag
		value: search criteria
	*/
	DictEntries	findDictTag(1:Credentials credentials, 2: UserDevice userdevice, 3: DictTag search, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of banks. 
		value: search criteria
	*/
	Banks	findBank(1:Credentials credentials, 2: UserDevice userdevice, 3: Bank search, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of banks. 
		value: search criteria
	*/
	Banks	findBankByName(1:Credentials credentials, 2: UserDevice userdevice, 3: STR name, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of OrgService. 
		value: search criteria
	*/
	OrgServices	findOrgService(1:Credentials credentials, 2: UserDevice userdevice, 3: OrgService search, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of Vehicle
		value: search criteria
	*/
	Vehicles	findVehicle(1:Credentials credentials, 2: UserDevice userdevice, 3: Vehicle search, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of Vehicle id
		value: search criteria
	*/
	Vehicleids	findVehicleid(1:Credentials credentials, 2: UserDevice userdevice, 3: Vehicle search, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		Add City
	*/
	City	addCity(1:Credentials credentials, 2: UserDevice userdevice, 3: City value) throws(1: ServiceFailure servicefailure),

	/*
		Add DictEntry
	*/
	DictEntry	addDictEntry(1:Credentials credentials, 2: UserDevice userdevice, 3: DictEntry value) throws(1: ServiceFailure servicefailure),

	/*
		Add bank
	*/
	Bank	addBank(1:Credentials credentials, 2: UserDevice userdevice, 3: Bank value) throws(1: ServiceFailure servicefailure),

	/*
		Add an organization
	*/
	Org	addOrg(1:Credentials credentials, 2: UserDevice userdevice, 3: Org value) throws(1: ServiceFailure servicefailure),

	/*
		Add taxi service
	*/
	OrgService	addOrgService(1:Credentials credentials, 2: UserDevice userdevice, 3: OrgService value) throws(1: ServiceFailure servicefailure),

	/*
		Add manager account
	*/
	Manager	addManager(1:Credentials credentials, 2: UserDevice userdevice, 3: Manager value) throws(1: ServiceFailure servicefailure),

	/*
		Add customer account
	*/
	Customer	addCustomer(1:Credentials credentials, 2: UserDevice userdevice, 3: Customer value) throws(1: ServiceFailure servicefailure),

	/*
		Add passenger account
	*/
	Passenger	addPassenger(1:Credentials credentials, 2: UserDevice userdevice, 3: Passenger value) throws(1: ServiceFailure servicefailure),

	/*
		Add driver account
	*/
	Driver		addDriver(1:Credentials credentials, 2: UserDevice userdevice, 3: Driver value) throws(1: ServiceFailure servicefailure),

	/*
		Add vehicle color
	*/
	DictEntry	addVehicleColor(1:Credentials credentials, 2: UserDevice userdevice, 3: STR name, 4: NUMBER32 value) throws(1: ServiceFailure servicefailure),


	/*
		Add vehicle brand
	*/
	DictEntry	addVehicleBrand(1:Credentials credentials, 2: UserDevice userdevice, 3: VehicleCategory category, 4: STR name) throws(1: ServiceFailure servicefailure),

	/*
		Add vehicle model
	*/
	DictEntry	addVehicleModel(1:Credentials credentials, 2: UserDevice userdevice, 3: ID brandid, 4: STR name, 5: NUMBER32 year) throws(1: ServiceFailure servicefailure),

	/*
		Add vehicle model
	*/
	DictEntry	addVehicleModelByBrandName(1:Credentials credentials, 2: UserDevice userdevice, 3: STR brandname, 4: STR name, 5: NUMBER32 year) throws(1: ServiceFailure servicefailure),

	/*
		Add tariff plan
	*/
	TariffPlan	addTariffPlan(1:Credentials credentials, 2: UserDevice userdevice, 3: TariffPlan value) throws(1: ServiceFailure servicefailure),

	/*
		Add rate
	*/
	Rate	addRate(1:Credentials credentials, 2: UserDevice userdevice, 3: Rate value) throws(1: ServiceFailure servicefailure),

	/*
		Add order
	*/
	ServiceOrder addServiceOrder(1:Credentials credentials, 2: UserDevice userdevice, 3: ServiceOrder value) throws(1: ServiceFailure servicefailure),

	/*
		Add service order decline
	*/
	ServiceOrderDecline addServiceOrderDecline(1:Credentials credentials, 2: UserDevice userdevice, 3: ServiceOrderDecline value) throws(1: ServiceFailure servicefailure),

	/*
		Add Claim
	*/
	Claim addClaim(1:Credentials credentials, 2: UserDevice userdevice, 3: Claim value) throws(1: ServiceFailure servicefailure),

	/*
		Add track
	*/
	Track addTrack(1:Credentials credentials, 2: UserDevice userdevice, 3: Track value) throws(1: ServiceFailure servicefailure),

	/*
		Remove manager
	*/
	void rmManager(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Remove tariff plan
	*/
	void rmTariffPlan(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Remove rate
	*/
	void rmRate(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Remove order
	*/
	void rmServiceOrder(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Remove service order decline
	*/
	void rmServiceOrderDecline(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Remove claim
	*/
	void rmClaim(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Remove track
	*/
	void rmTrack(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Remove track
	*/
	void rmOldTracks(1:Credentials credentials, 2: UserDevice userdevice, 3: DATE olderthan) throws(1: ServiceFailure servicefailure),

	/*
		List of organization
		search: search criteria
	*/
	Orgs	findOrg(1:Credentials credentials, 2: UserDevice userdevice, 3: Org search, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of organization
		name: search criteria
	*/
	Orgs	findOrgByName(1:Credentials credentials, 2: UserDevice userdevice, 3: STR name, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of predefined colors
		name: red,..
	*/
	DictEntries	findColor(1:Credentials credentials, 2: UserDevice userdevice, 3: STR name, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of brands
		name: search criteria
	*/
	DictEntries	findBrand(1:Credentials credentials, 2: UserDevice userdevice, 3: STR name, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of models
		brandid, name: search criteria
	*/
	DictEntries	findModel(1:Credentials credentials, 2: UserDevice userdevice, 3: ID brandid, 4: STR name, 5: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of models
		brandid, name: search criteria
	*/
	DictEntries	findModelByBrandName(1:Credentials credentials, 2: UserDevice userdevice, 3: STR brandname, 4: STR name, 5: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of cities
		name: search criteria
	*/
	Cities	findCity(1:Credentials credentials, 2: UserDevice userdevice, 3: STR name, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of managers
		search: search criteria
	*/
	Managers	findManager(1:Credentials credentials, 2: UserDevice userdevice, 3: Manager search, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of drivers
		search: search criteria
	*/
	Drivers	findDriver(1:Credentials credentials, 2: UserDevice userdevice, 3: Driver search, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),


	/*
		List of avalable drivers in the city
	*/
	DriverOnlineMap getDriverOnlineAvailable(1:Credentials credentials, 2: UserDevice userdevice, 3: Cityid cityid) throws(1: ServiceFailure servicefailure),
	
	/*
		List of avalable drivers in the city
	*/
	Drivers getDriverAvailable(1:Credentials credentials, 2: UserDevice userdevice, 3: Cityid cityid) throws(1: ServiceFailure servicefailure),
	
	/*
		List of customer
		search: search criteria
	*/
	Customers	findCustomer(1:Credentials credentials, 2: UserDevice userdevice, 3: Customer search, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of passengers
		search: search criteria
	*/
	Passengers	findPassenger(1:Credentials credentials, 2: UserDevice userdevice, 3: Passenger search, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of tariff plans
	*/
	TariffPlans	findTariffPlan(1:Credentials credentials, 2: UserDevice userdevice, 3: TariffPlan search, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of rates
	*/
	Rates	findRate(1:Credentials credentials, 2: UserDevice userdevice, 3: Rate search, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of Orders
	*/
	ServiceOrders	findServiceOrder(1:Credentials credentials, 2: UserDevice userdevice, 3: ServiceOrder search, 4: DateRange sheduletime, 5: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of OrderDecline 
	*/
	ServiceOrderDeclines findServiceOrderDecline(1:Credentials credentials, 2: UserDevice userdevice, 3: ServiceOrderDecline search, 4: DateRange sheduletime, 5: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of Claims
	*/
	Claims findClaim(1:Credentials credentials, 2: UserDevice userdevice, 3: Claim search, 4: DateRange sheduletime, 5: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of Track
	*/
	Tracks findTrack(1:Credentials credentials, 2: UserDevice userdevice, 3: Track search, 4: DateRange sheduletime, 5: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		Pings
		personrole: Driver, Passenger, Manager 
	*/
	NotificationEvents getEvents(1:Credentials credentials, 2: UserDevice userdevice, 3: RowRange rowrange) throws(1: ServiceFailure servicefailure),

}
