/*
	B2B Taxi thrift IDL file.
*/

/*
	Namespaces
*/
namespace cpp	taxi
//namespace java	ru.car4b.thrift
namespace java	ru.car4b.android.thrift
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
	Типы расположения помещений организаций. Организация может иметь несколько локаций. Должен быть указан головной офис. Другие адреса опционально.
	
*/
enum OrgBuilding
{
	OFFICEMAIN	=	0,	// головной офис (офис [территориального] подразделения)
	FACILITY	=	1	// рабочие, торговые площади, склады
}

/*
	Тип одной организации со стороны клиентов и сотрудников. Один и тот же сервис может иметь 
	разные ИП для расчетов с разными организациями.
*/
enum OrgServiceDept
{
	CUSTOMER	=	0,	// для выставления счетов
	DRIVER		=	1,	// для расчетов с водителями
	OTHER		=	2	// для расчетов с другими организациями
}

/*
	Роль организаций в информационном обмене
*/
enum OrgRole
{
	ORGGUEST	=	0,		//	Потенциальный клиент
	ORGSERVICE	=	1,		//	Сервис (город)
	ORGTAXI		=	2,		//	Таксомоторная служба
	ORGCUSTOMER	=	3,		//	Клиент
	ORGBANK		=	4,		//	Банк
	ORGPROCESSOR	=	5		//	РКО, Процессинг карт
}

/*
	Типы орг.роли такси: Сервис и таксомоторные службы
*/
enum TaxiServiceRole
{
	TS_DISPATCH	=	0,		//	диспетчерский сервис (мы)
	TS_CARPOOL	=	1		//	другие службы такси (таксопарки)
}

/*
	Роли пользователей в сервисе
*/
enum PersonRole 
{
	ADMIN		=	0		//	не используется, Сервиса диспетчеров пассажиров
	MANAGER		=	1,		//	Бухгалтер или Сотрудник Сервиса(диспетчера пассажиров
	CUSTOMER	=	2,		//	Клиент
	DISPATCHER	=	3,		//	Диспетчер экипажей таксомоторной службы (автобазы)
	DRIVER		=	4,		//	Водитель, ИП
	MASTER		=	5,		//	Водитель бриагадир
	OPERATOR	=	6,		//	Customer+Passenger
	PASSENGER	=	7,		//	Пользователь
	GUEST		=	8,		//	web user, роль не определена
	NOTAUTHORIZED	=	9,		//	в ответе клиенту, не авторизован
}

/*
	Роли пользователей в организации- для подписи руководитель CHIEF и главбух ACCT
	Для контакта- менеджер (MGR)
	Для водителей указывается SELFEMP
*/
enum OrgPosition
{
	SELFEMP		=	0,		//	самозанятый, водитель
	EMP		=	1,		//	сотрудник
	CHIEF		=	2,		//	руководитель
	ACCT		=	3,		//	главбух
	MGR		=	4		//	начальник
}

/*
	Роли пользователей в заказе: 
		- пользователь (основной, могут быть другие пассажиры)
		- кто заказал (контакт может быть с ним, если для кого заказано, не беспокоить)
*/
enum OrderRole
{
	ORDER_FOR	=	0,		//	заказано для (пользователь)
	ORDER_BY	=	1		//	кем заказано
}

/*
	Экипаж:
		- водитель, он же курьер
		- грузчик
*/
enum CrewRole
{
	CREW_DRIVER	=	0,		//	также курьер
	CREW_LOADER	=	1		//	грузчик
}

/*
	Адреса юр, фактический, для отчетов
*/
enum OrgAddressType
{
	OA_REPORT	=	0,		//	Адрес для отчетности
	OA_LEGAL	=	1,		//	Адрес юридический
	OA_REAL		=	2		//	Адрес фактический
}

typedef map<OrgAddressType, STR> OrgAddress

/*
	Типы устройств
*/
enum DeviceType 
{
	UNKNOWN		=	0		//	не определен
	ANDROID		=	1,		//	Android
	IOS		=	2,		//	вражье, не используется
	JAVAME		=	3,		//	деревяшка, не используется
	MOBILEBROWSER	=	4,		//	Браузер с мобилы
	DESKTOPBROWSER	=	5,		//	Браузер
	APPSERVICE	=	6		//	Сервис
}

enum EmployeeStatus
{
	ACTIVE		=	1,		//	обслуживать
	INACTIVE	=	2,		//	не обслуживать (в отпуске)
	DELETED		=	3		// 	уволен
}

enum VehicleStatus
{
	ACTIVE		=	1,		//	доступен 
	INACTIVE	=	2		//	неисправен
}

enum DocumentType
{
	PASSPORT	=	1,		//	паспорт
	DRIVERLICENSE	=	2,		//	вод.удостоверение
	ACT		=	3,		//	акт
	BILL		=	4,		//	счет
	RECEIPT		=	5,		//	квитанция
	WAYBILL		=	6,		//	путевой лист
	ENTLICENSE	=	7,		//	лицензия предпринимателя
	PAYMENTRECEIPT	=	8,		//	квитанция об оплате
}

/*
	Какие заказы доступны
*/
enum CanOrder
{
	EVERYTHING	=	1,		//	обслуживать
	NOTHING		=	2,		//	не обслуживать
	ONLYROUTE	=	3		// 	только по маршруту
}

enum CabClass
{
	ECONOMY		=	1,		//	Эконом
	COMFORT		=	2,		//	Комфорт
	PREMIUM		=	3		// 	Премиум
}

/*
	Тип заказа по времени
*/
enum OrderTimeType
{
	URGENT		=	1,		//	срочный
	SPECIFIEDTIME	=	2,		// 	Запланированный в точно указанное время в течение суток
	EVERYDAY	=	3		//	Запланированный в точно указанное время ежедневно в заданные дни недели
}

enum OrderFeature
{
	CHILDSEAT	=	1,		//	детское кресло
	LOADER		=	2		//	грузчик
}

typedef	set<OrderFeature>  OrderFeatures

enum OrderStage
{
	ORDERNEW	=	0,		//	заказ не обработан
	ORDERACCEPT	=	1,		//	заказ принят
	ORDERASSIGN	=	2,		//	сервис передал выбранному водителю уведомление, но не получил подтверждения
	ORDERASSIGNED	=	3,		//	Не используется. получил подтверждение от водителя, заказ принят
	ORDERCONFIRMED	=	4,		//	Пользователь согласился с временем ожидания, выставленного водителем
	ORDERDRIVING	=	5,		//	Водитель приступил к исполнению заказа (выехал к Пользователю)
	ORDERWAITING	=	6,		//	прибыл на начальную точку маршрута, ожидает Пользователя
	ORDERTRANSPORTING=	7,		//	везет Пользователя к месту назначения
	ORDERSTOP	=	8,		//	Временная остановка
	ORDERCOMPLETE	=	9,		//	Заказ выполнен
	ORDERDECLINED	=	10,		//	заказ отвергнут сервисом (нехороший клиент, нет свободных экипажей, ..)
	ORDERCANCELLED	=	11,		//	Заказ отменен Пользователем
	ORDERFAILED	=	12		//	Заказ отменен Водителем или никем не взят(просрочено исполнение)
}

enum PaymentState
{
	READY		=	0,		//	выставлен счет, еще не оплачено
	PAID		=	1,		//	оплачено
	UNPAID		=	2		//	Клиент отказался оплачивать
}

enum ClaimState
{
	CLAIMNO		=	0,		// жалоб нет
	CLAIM		=	1,		// есть жалоба
	CLAIMCLOSED	=	2		// жалоба закрыта
}

/*
	tax
*/
enum TaxType
{
	TAXORG		=	1,		//	Юр. лицо, организация
	TAXPERSON	=	2,		//	ИП
	TAXFARMER	=	3,		//	Крестьянское (фермерское) хозяйство
	TAXLAWYER	=	4,		//	Адвокат
	TAXNOTARY	=	5		//	Нотариус
}

/*
	organization type
*/
enum OrgType
{
	ORGGOV		=	1,		//	правительственная организация
	ORGCOMM		=	2,		//	некоммереческая организация
	ORGENTERPRISE	=	3,		//	коммерческоре предприятие
	ORGFARMER	=	4,		//	Крестьянское (фермерское) хозяйство
	ORGOTHER	=	5		//	другие организации
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
	VEHICLE_SMALL1	=	1,		//	Особо малый
	VEHICLE_SMALL2	=	2,		//	Малый
	VEHICLE_MIDDLE1	=	3,		//	Первый средний
	VEHICLE_MIDDLE2	=	4,		//	Средний
	VEHICLE_MIDDLE3	=	5,		//	Высший средний
	VEHICLE_SUPER	=	6,		//	Высший
	VEHICLE_CROSS	=	7,		//	Кроссовер
	VEHICLE_VAN	=	8,		//	Минивэн
	VEHICLE_COUPE	=	9		//	Купе
}

enum VehicleCategory
{
	VEHICLE_CAR	=	1,		//	Легковое авто
	VEHICLE_BIKE	=	2,		//	Мото транспорт
	VEHICLE_SPEC	=	3,		//	Спецтехника
	VEHICLE_TRAILER	=	4,		//	Прицеп
	VEHICLE_TRUCK	=	5,		//	Грузовой транспорт
	VEHICLE_BUS	=	6,		//	Автобус
}

enum StopType
{
	STOP_WAIT	=	1,		//	Пассажир выходит и заходит
	STOP_PICKUP	=	2,		//	Посадка пассажира
	STOP_THROW	=	3,		//	Высадка пассажира
	STOP_LOAD	=	4,		//	Прием груза
	STOP_UNLOAD	=	5		//	Сдача груза
}

enum DeclineOrderCause
{
	DECLINE_ASSIGN_BY_DRIVER	=	0,
	DECLINE_BY_DRIVER		=	1,
	DECLINE_BY_SERVICE		=	2,
	DECLINE_BY_PASSENGER		=	3,
	DECLINE_BY_DISPATCHER		=	4,
}

enum BankRole
{
	BANK_ACCOUNT	=	0
}

enum ErrorType
{
	ERR_FATAL	=	0,		//	че к чему
	ERR_BACKEND	=	1,		//	СУБД
	ERR_NOT_FOUND	=	2,		//	нет объекта с указанным идентиификатором или удовлетворяющим поисковому запросу
	ERR_APP		=	3,		//	App service
	ERR_TOKEN_EXPIRED=	4,		//	токен просрочен
	ERR_LOGIN	=	5		//	неверный логин/пароль
}

enum DictTag
{
	TAG_VEHICLE_COLOR	=	1,		//	Цвет
	TAG_VEHICLE_BRAND	=	2,		//	Марка
	TAG_VEHICLE_MODEL	=	3		//	Модель
}

enum StageGroup
{
	ORDERS_ALL		=	0,		//	все
	ORDERS_INIT		=	1,		//	новые
	ORDERS_PROCESS		=	2,		//	взятые заказы
	ORDERS_DONE		=	3		//	исполненные (успешно завершенные, завершенные с ошибками)
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
	1:	GEO latitude,				//	Широта
	2:	GEO longitude				//	Долгота
}

struct City
{
	1:	ID id,					//	идентификатор элемента словаря
	2:	ID areaid,				//	идентификатор адм.ед.
	3:	NUMBER32 tag,				//	номер 
	4:	STR name,				//	название города
	5:	STR notes,				//	описание
	6:	GeoLocation geolocation,		//	геокоординаты
	7:	NUMBER32 timezone			//	часовой пояс города
}

typedef list<City> Cities
typedef ID Cityid
typedef list<Cityid> Cityids

struct DictEntry
{
	1:	ID id,					//	идентификатор элемента словаря
	2:	ID parent,				//	идентификатор родительского элемента словаря
	3:	DictTag tag,				//	словарь
	4:	NUMBER32 idx,				//	индекс элемента словаря
	5:	STR strvalue,				//	текстовое значение элемента словаря
	6:	i64 intvalue				//	числовое значение элемента словаря
}

typedef	list<DictEntry>  DictEntries

struct PassengerLimit
{
	1:	ID id,					//	идентификатор
	2:	NUMBER32 tripcount,
	3:	NUMBER32 minutescount,
	4:	CURR moneycount,
}


typedef	map<Month, PassengerLimit>  PassengerLimitMonth

struct Payload
{
	1:	NUMBER32 passengercount,		//	число пассажиров, чел.
	2:	NUMBER32 baggagecount,			//	число мест багажа, шт. если по весу
	3:	NUMBER32 baggageweight,			//	вес багажа, кг.
	4:	NUMBER32 baggagewidth,			//	ширина всех мест багажа
	5:	NUMBER32 baggageheight,			//	высота всех мест багажа
	6:	NUMBER32 papercount,			//	число листов (коррепонденции) (сопроводительная документация, курьерская доставка) если без веса
	7:	NUMBER32 stopcount			//	число планируемых остановок для курбера по маршруту
}

struct PassengerUsage
{
	1:	ID id,					//	идентификатор
	2:	NUMBER32 tripcount,
	3:	NUMBER32 minutescount,
	4:	CURR moneycount,
	5:	Payload payload,			//	груз, пассажиры, курьерские заказы
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
	6:	bool hasGSMorCDMA,			//	планшеты не все имеют
	7:	bool hasGPS,				//	геолокация по GPS
	8:	bool isGPS,				//	геолокация по GPS включена
	9:	GeoLocation geolocation,
	10:	NUMBER32 apiversion,			//	useless 2014/11/19
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
	Начальники организации
*/
typedef map<OrgPosition, Person> OrgPositionPerson

/*
	Сотрудники организации, участвующие в промежуточной посадке для оповещения
*/
typedef list<Person> OrderStopPersons

struct Bank
{
	1:	ID id,
	2:	STR bik,				//	БИК
	3:	STR name				//	название банка
}

typedef ID Bankid
typedef map<BankRole, Bankid> OrgBank
typedef list<Bankid> Bankids
typedef list<Bank> Banks

/*
	Точка маршрута
*/
struct Location
{
	1:	GeoLocation location,			//	Широта, Долгота
	2:	STR name,
	3:	ID cityid,				//	город
	4:	STR city,				//	локализованное название города
	5:	STR address
}

typedef map<OrgBuilding, Location> OrgLocation

struct Org
{
	1:	ID id,			//	Идентификатор
	2:	OrgRole orgrole,	//	Роль организации в БП
	3:	OrgType orgtype,	//	тип организации
	4:	DATE start,		//	начало работы с клиентом или начало работы сервиса
	5:	NUMBER32 tag,
	6:	STR name,		//	Название предприятия
	7:	STR fullname,		//	Полное название
	8:	STR shortname,		//	Краткое название, аббревиатура
	9:	STR inn,		//	ИНН
	10:	STR kpp,		//	КПП
	11:	STR ogrn,		//	ОГРН
	12:	OrgAddress orgaddress,	//	Адреса для отчетности, юридический, фактический
	13:	TEL phone,		//	Телефон
	14:	MAILTO email,		//	E-mail
	15:	OrgPositionPerson employee,//	Руководитель, Главный бухгалтер
	16:	OrgBank bank,		//	Банк
	27:	STR currentaccount,	//	Расчетный счет
	28:	STR correspondentaccount,//	Корр/счет
	29:	OrgLocation orglocation,//	расположения зданий офиса и вспомогательных помещений
	30:	STR description,  	//	пометки
	31:	STR note		//	Примечание
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
	2:	Orgid orgid,		//	Роль организации в БП
	3:	STR name,		//	Название подразделения
	4:	STR fullname,		//	Полное название
	5:	STR shortname,		//	Краткое название, аббревиатура
	6:	OrgAddress orgaddress,	//	Адреса для отчетности, юридический, фактический
	7:	TEL phone,		//	Телефон
	8:	MAILTO email,		//	E-mail
	9:	OrgPositionPerson employee,	//	Руководитель, Главный бухгалтер
	10:	OrgBank bank,		//	Банк
	11:	STR currentaccount,	//	Расчетный счет
	12:	STR correspondentaccount,//	Корр/счет
	13:	OrgLocation orglocation,//	main office location
	14:	STR description,	//	Описание
	15:	STR note		//	Примечание
}

typedef map<OrgServiceDept, Orgid> OrgServiceDepts
/*
	taxi service
*/
struct OrgService
{
	1:	ID id,				//	идентификатор
	2:	OrgServiceDepts organization,	//	организация
	3:	STR name,
	4:	OrgLocation orglocation		//	downtown location
}

typedef list <OrgService> OrgServices
typedef ID OrgServiceid
typedef map <TaxiServiceRole, OrgServiceid> RoleOrgService

struct Customer
{
	1:	ID id,			//	Л/С
	2:	ID cityid,		//	Город, где находится клиент, дублирует RoleOrgService
	3:	STR nickname,		//	Внутреннее имя для поиска
	4:	TAG tag,		//	тег (группа)
	5:	OrgServiceDepts organization,	//	организация
	6:	RoleOrgService svc,	//	Предпочитаемый сервис (диспетчер в городе, и таксомоторной службы (автобазы)- чей водитель)
	7:	ID dispatcherid,	//	закрепленный диспетчер экипажей таксомоторной службы (автобазы).
	8:	TaxType taxtype,	//	налогообложение
	9:	bool active,		//	false: договор расторгнут
	10:	bool enabled,		//	false: обслуживание приостановлено (задолженность,...)	
	11:	ID tariffplanid,	//	тарифный план
	12:	bool haspreferreddriver,//	есть предпочитаемый водитель
	13:	ID preferreddriverid,	//	ID предпочитаемого водителя. НЕ ВОДИТЕЛЬ, а ID!
	14:	bool hascredit,		//	Может в кредит
	15:	bool hascreditlimit,	//	Но с лимитом
	16:	CURR creditlimit,	//	размер лимита в рублях
}

typedef list <Customer> Customers
typedef ID Customerid
typedef list <Customerid> Customerids

struct CustomerStatistic
{
	1:	ID id,			//	Л/С
	2:	ID cityid,		//	Город, где находится клиент, дублирует customerid
	3:	ID customerid,		//	# заказчика
	4:	TAG tag,		//	тег (группа)
	5:	bool enabled,		//	false: не включать в сводку
	6:	CURR currentbalance,	//	примерный баланс лицевого счета
	7:	PassengerUsageMonth usagemonth,	//	статистика по месяцам
	8:	PassengerUsageYear usageyear,	//	статистика по годам
}

typedef list <CustomerStatistic> CustomerStatistics
typedef ID CustomerStatisticid
typedef list <CustomerStatisticid> CustomerStatisticids

struct Passenger
{
	1:	ID id,				//	Passenger Id
	2:	ID cityid,			//	Город, где сейчас находится пассажир
	3:	ID customerid,			//	#Заказчик
	4:	NUMBER32 tag,			//	тег
	5:	bool isoperator,		//	Является оператором
	6:	bool isvip,			//	Требует особого внимания
	7:	EmployeeStatus status,		//	Действующий Неработающий Удаленный
	8:	Person person,			//	Пользователь (пассажир, оператор) может быть в нескольких организациях. Идентифицируются по номеру телефона.
	9:	CanOrder canorder,		//
	10:	PassengerLimitMonth limitmonth,	// лимиты в месяц
	11:	PassengerUsageMonth usagemonth	// статистика пользования сервисом в месяц
}

typedef ID Passengerid
typedef list <Passenger> Passengers
typedef list <Passengerid> Passengerids

struct Vehicle
{
	1: ID id,
	2: VehicleType vehicletype = VehicleType.CAR,	// только легковые автомобили или курьер
	3: VehicleCategory vehiclecategory,	//	категория ТС
	4: VehicleClass vehicleclass,		//	класс авто в категории
	5: VehicleStatus vehiclestatus,		//	текстовое описание в technicalcondition
	6: ID vehiclebrandid,			//	DictEntry Производитель
	7: ID vehiclemodelid,			//	DictEntry Модель, сгруппировано по производителю
	8: ID colorid,				//	DictEntry Цвет
	9: NUMBER32 year,				//	Год выпуска
	10: STR plate,				//	Регистрационный номер
	11: NUMBER32 platenumber,			//	Рег номер без букв
	12: STR technicalcondition,		//	Техническое состояние
	13: NUMBER32 passengercount,			//	вместимость, пассажиров
	14: bool childseat,			//	Детское кресло
	15: bool checkers,			//	Шашки
	16: bool stickers,			//	Наклейки
	17: bool lantern,			//	Фонарь
	18: LINK photo,				//	Фото
	19: STR vin				//	идентификационный номер ТС
}
          
typedef ID Vehicleid
typedef list<Vehicleid> Vehicleids
typedef list<Vehicle> Vehicles

struct Document
{
	1:	ID id,			//	document Id
	2:	STR ser,		//	Серия
	3:	STR number,		//	Номер
	4:	STR issuer,		//	Кем выдан
	5:	DATE issued,		//	Когда выдан
	6:	DATE validity,		//	Дествителен до
	7:	STR category,		//	Категория(и)
	8:	NUMBER32 expirience		//	Стаж

}

typedef ID Documentid
typedef map<DocumentType, Documentid> DocumentMap

struct Manager
{
	1:	ID id,			//	Manager Id
	2:	ID cityid,		//	Город, где сейчас находится менеджер (дублирует RoleOrgService)
	3:	RoleOrgService svc,	//	Сервис (диспетчер в городе, и опционально автобаза- чей водитель)
	4:	EmployeeStatus status,	//	Действующий Неработающий Удаленный
	5:	Person person,		//	was OrgPositionPerson ФИО, телефон
	6:	DocumentMap license,	//	могут быть какие то документы
	7:	STR nickname,		//	ник
	8:	bool online,		//	Менеджер на смене
	9:	bool isadmin,		//	Администратор

}

typedef ID Managerid
typedef list<Manager> Managers
typedef list<Managerid> Managerids

struct Driver
{
	1:	ID id,			//	Driver Id
	2:	ID cityid,		//	Город, где сейчас находится водитель (дублирует RoleOrgService)
	3:	RoleOrgService svc,	//	Сервис (организация диспетчера пассажиров в городе- car4b, и организация диспетчера экипажей таксомоторной службы (автобазы)
	4:	GeoLocation geolocation,//	Последнее нахождение
	5:	DATE updated,		//	Время, когда последний раз определялись координаты
	6:	ID serviceorderid,	//	0 - свободен, иначе номер заказа
	7:	EmployeeStatus status,	//	Действующий Неработающий Удаленный
	8:	Person person,		//	was OrgPositionPerson ФИО, фото
	9:	DocumentMap license,	//	вод. удостоверение, пут. лист
	10:	STR nickname,		//	ник
	11:	NUMBER32 callsign,	//	Позывной рации
	12:	CabClass cabclass,	//	Класс экипажа
	13:	NUMBER32 rating,	//	Рейтинг (карма) 0- максимальная, 32767- минимальная
	14:	bool online,		//	Водитель на линии
	15:	bool ismaster,		//	Бригадир
	16:	Vehicleids vehicleids,	//	текущие автомобили, используемые водителем при оказании услуг
	17:	PassengerUsageMonth usagemonth,	//	статистика по месяцам
	18:	PassengerUsageYear usageyear,	//	статистика по годам
	19:	NUMBER32 rating5,	//	Рейтинг (карма) наоборот, считая 5 максимальным. 5-rating. т.е. 5->0, 4->1,...0->5. при установлении: если rating5 != 5-rating, то приоритет имеет большее число(то есть ненулевое), если равны, то rating5. То есть по умолчанию устанавливается низший приоритет 5

}

typedef ID Driverid
typedef list<Driver> Drivers
typedef list<Driverid> Driverids
typedef map<ID, Driver> DriverMap

/*
	Driver занимает много памяти, поэтому идентификатор
*/
struct DriverOnline
{
	1:	Driverid driverid,		//	№ водителя
	2:	GeoLocation geolocation,	//	положение
	3:	ID serviceorderid,		//	0 - свободен
}

typedef map <Driverid, DriverOnline> DriverOnlineMap
typedef map<Cityid, DriverOnlineMap> CityDriverOnlineMap
typedef list<DriverOnline> DriverOnlines

/*
	Диспетчер экипажей таксомоторной службы (автобазы) может быть прикреплен к Клиенту (Customer) независимо 
	от того, прикоеплена ли к нему организация диспетче6ра экипажей таксомоторной службы (автобазы)
*/
struct Dispatcher
{
	1:	ID id,			//	Dispatcher Id
	2:	RoleOrgService svc,	//	Сервис (диспетчер пассажиров в городе- car4b, и диспетчер машин таксомоторной службы (автобазы)
	3:	EmployeeStatus status,	//	Действующий Неработающий Удаленный
	4:	Person person,		//	was OrgPositionPerson ФИО, телефон
	5:	DocumentMap license,	//	могут быть какие то документы
	6:	STR nickname,		//	ник
	7:	bool online,		//	Диспетчер на смене
	8:	ID cityid		//	Город, за который отвечает диспетчер. Диспетчер может быть в другом городе
}

typedef ID Dispatcherid
typedef list<Dispatcherid> Dispatcherids
typedef list<Dispatcher> Dispatchers

/*
	Экипаж
*/
typedef map<CrewRole, Driverid> Crew

typedef ID Serviceorderid

struct ServiceOrderStop
{
	1:	ID id,			//	Номер остановки
	2:	Serviceorderid serviceorderid,	//	#заказа
	3:	NUMBER32 stopno,		//	порядковый номер остановки
	4:	StopType stoptype,	//	тип остановки: пикап, выгрузка, курьер
	5:	OrderStopPersons pickuppersons,//	кого посадить- пикап сотрудников или кому отдать (курьер)
	6:	Payload payload,	//	Загрузка
	7:	OrderStage stage,	//	Стадия исполнения заказа (например, Водитель взял заказ)
	8:	DATE created,		//	время поступления заказа
	9:	DATE assigned,		//	время назначения водителя
	10:	DATE started,		// 	время, когда водитель начал исполнение заказа (выезжает)
	11:	DATE arrived,		// 	время, когда водитель прибыл в начальную точку
	12:	DATE finished,		//	время, когда водитель завершил исполнение заказа (успешно или нет)
	13:	STR notes		//	пометки
}

typedef ID ServiceOrderStopid
typedef list<ServiceOrderStopid> ServiceOrderStopids
typedef list<ServiceOrderStop> ServiceOrderStops

typedef ID Sheduleid

/*
	properties
*/
typedef map<STR, STR> Strings

/*
	Common property name
*/
const list<STR> CommonProperties = [
	"drivercallsign",
	"driverfirstname",
	"driverlastname",
	"drivermiddlename",
	"driverphone",
	"vehiclebrand",
	"vehiclemodel",
	"vehiclecolor",
	"vehicleplate"
]

struct ServiceOrder
{
	1:	ID id,			//	Номер счета
	2:	ID cityid,		//	Город, дублирует RoleOrgService
	3:	NUMBER32 tag		//	категория или пачка (для учета)
	4:	OrderType ordertype,	//	тип заказа: такси, курьер
	5:	OrderTimeType ordertimetype,//	Тип заказа по времени
	6:	OrderFeatures orderfeatures,//	дополнительные фичи: кресло, и т.д.
	7:	RoleOrgService svc,	//	Сервис (в каком городе, чьи авто)
	8:	ID dispatcherid,	//	№ диспетчера в организация диспетчера экипажей таксомоторной службы (автобазы)
	9:	Personid passengerid,	//  passenger person
	10:	Sheduleid sheduleid,	// != 0 shedule identifier
	11:	Passengerids passengers,	//	Начальный пользователь клиента (может быть пустым, или несколько)
	12:	ServiceOrderStopids stops,//	Промежуточные остановки
	13:	Payload payload,	//	Загрузка
	14:	OrderStage stage,	//	Стадия исполнения заказа (например, Водитель взял заказ)
	15:	Crew crew,		//	Водитель, авто, взявшее заказ и опционально экспедитор, грузчик
	16:	DATE created,		//	время поступления заказа
	17:	DATE sheduletime,	//	время, когда надо подать машину (если ordertimetype != OrderTimeType::URGENT)
	18:	DATE assigned,		//	время назначения водителя
	19:	DATE started,		// 	время, когда водитель начал исполнение заказа (выезжает)
	20:	DATE arrived,		// 	время, когда водитель прибыл в начальную точку
	21:	DATE finished,		//	время, когда водитель завершил исполнение заказа (успешно или нет)
	22:	DATE estimated,		//	время, ожидаемое для подачи для срочных заказов
	23:	DATE stagemodified,	//	время, когда было последнее изменение stage или выбор водителя
	24:	Location locstart,
	25:	Location locfinish,
	26:	ID preferreddriverid,	//	ID предпочитаемого водителя в дополнение к предпочитемому Заказчиком (вторая очередь). НЕ ВОДИТЕЛЬ, а ID!
	27:	DATE totaltimefiscal,	//	чистое время в пути в секундах "по счетчику"
	28:	DATE totaltimeactual,	//	чистое время в пути в секундах, выставленное водителем
	29:	CURR sumfiscal,		//	сумма "по счетчику"
	30:	CURR sumactual,		//	сумма к оплате (выставленная водителем в минутах с учетом скидок и др.)
	31:	CabClass cabclass,	//	Класс экипажа
	32:	PaymentState paymentstate,
	33:	ClaimState claimstate,	//	жалоба есть, нет, закрыта
	34:	bool hasstops,		//	есть промежуточные остановки или точки доставки (приема документов курьером)
	35:	STR notes,		//	пометки
	36:	bool iscalculated,	//	сумма подсчитана
	37:	NUMBER32 offers,	//	количество экипажей, которым было предложено взять заказ
	38:	NUMBER32 flagsstagesent,//	маска отправенных нотификаций на стадии
	39:	Strings properties 	//	разные свойства в виде строк
}

typedef ID ServiceOrderid
typedef list<ServiceOrderid> ServiceOrderids
typedef list<ServiceOrder> ServiceOrders


/*
	Отказ водителя от заказа для периодической порчи кармы
*/
struct ServiceOrderDecline
{
	1:	ID id,				//	идентификатор
	2:	Serviceorderid serviceorderid,	//	#Заказ
	3:	DATE declinetime,		//	Время отказа (для сортировки)
	4:	Driverid driverid,		//	#Водитель
	5:	DeclineOrderCause cause,	//	Причина отказа от заказа
	6:	STR notes,			//	Причина отказа от заказа текстом
}

typedef ID ServiceOrderDeclineid
typedef list<ServiceOrderDeclineid> ServiceOrderDeclineids
typedef list<ServiceOrderDecline> ServiceOrderDeclines

/*
	Переписка по жалобе между дисетчером водлителем клиентом и пользователем
*/
struct Claim
{
	1:	ID id,					//	идентификатор
	2:	Serviceorderid serviceorderid,		//	#Заказ
	3:	PersonRole personrole,			//	Кто оставил сообщение в жалобе
	4:	Driverid driverid,			//	#Водитель
	5:	DATE claimtime,				//	Время жалобы или ответа на жалобу
	6:	STR notes				//	Текст сообщения
}

typedef ID Claimid
typedef list<Claimid> Claimids
typedef list<Claim> Claims

/*
	Трекинг. Не используется.
*/
struct Track
{
	1:	ID id,					//	Identifier
	2:	Driverid driverid,			//	Водитель
	3:	Serviceorderid serviceorderid,		//	Заказ
	4:	DATE tracktime,				//	Время 
	5:	GeoLocation location			//	Широта, Долгота
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
	График движения
*/
struct Shedule
{
	1:	ID id,					//	Identifier
	2:	bool active,				//	Активен
	3:	SheduleDays sheduledays,		//	дни недели
	4:	ID customerid,				//	#Заказчик
	5:	STR name,
	6:	STR description,
	7:	NUMBER32 tag				//	категория или пачка (для учета)
	8:	OrderType ordertype,			//	тип заказа: такси, курьер
	9:	OrderFeatures orderfeatures,		//	дополнительные фичи: кресло, и т.д.
	10:	Location pointstart,			//	Точка
	11:	Location pointfinish,			//	Точка
	12:	bool hasMiddlePoints,			//	есть остановки (возможно с ожиданием пикапа пассажиров)
	13:	bool haspassenger,			//	если нужно оджидать какого то пассажира
	14:	Passengerid passengerid,		//	ожидаемый первый пассажир (необязательно, и не проверяются лимиты)
	15:	Passengerids passengers,		//	другие ожидаемые пассажиры (необязательно)
	16:	DATE timestart,				//	час и минута старта
	17:	DATE timefinish,			//	час и минута окончания
	18:	ID sheduleoperatorid,			//	оператор маршрута
	19:	ID preferreddriverid			//	ID предпочитаемого водителя в дополнение к предпочитемому Заказчиком (вторая очередь). НЕ ВОДИТЕЛЬ, а ID!
}

typedef list<Shedule> Shedules
typedef list<Sheduleid> Sheduleids

/*
	Черный список водителей
*/
struct DriverBlackList
{
	1:	ID id,					//	Identifier
	2:	DATE created,				//	дата внесения
	3:	ID customerid,				//	#Заказчик
	4:	ID driverid				//	#Водитель
}

typedef ID DriverBlackListid
typedef list<DriverBlackList> DriverBlackLists
typedef list<DriverBlackListid> DriverBlackListids

/*
	Промежуточные остановки плана
*/
struct SheduleStop
{
	1:	ID id,					//	Identifier
	2:	ID sheduleid,				//	План поездок
	3:	Location point,				//	Точка
	4:	NUMBER32 position,				//	порядковый номер в плане
	5:	bool haspassenger,			//	если нужно оджидать какого то пассажира
	6:	ID passengerid				//	ожидаемый пассажир (необязательно)
}

/*
	Тарифные планы
*/
struct TariffPlan
{
	1:	ID id,					//	Identifier
	2:	OrgServiceid orgserviceid,		//	Сервис
	3:	ID cityid,				//	город
	4:	STR name,				//	Название
	5:	STR notes,			//	Описание
	6:	bool active,				//	Статус активности. false- архивный тариф.
}

typedef ID TariffPlanid
typedef list<TariffPlan> TariffPlans
typedef list<TariffPlanid> TariffPlanids

/*
	Тарифы
*/
struct Rate
{
	1:	ID id,					//	Identifier
	2:	ID tariffplanid,			//	Тарифный план
	3:	STR name,				//	Название
	4:	bool active,				//	Статус активности. false- архивный тариф.
	5:	DATE datestart,				//	начало действия тарифа. Если active: true, игнорируется!
	6:	DATE datefinish,			//	начало окончания действия тарифа. Если active: true, игнорируется!
	7:	bool isweekend,				// 	по выходным
	8:	bool isday,				// 	по времени дня
	9:	NUMBER32 hourstart,			//	начало действия тарифа в течение дня- час
	10:	NUMBER32 hourfinish,			//	начало окончания тарифа в течение дня- час
	11:	CURR costmin,				//	Мин. Стоимость
	12:	CURR priceboarding,			//	за посадку
	13:	CURR priceminute,			//	Цена минуты
	14:	CURR pricedelay,			//	Цена минуты простоя 
	15:	CURR pricewait,				//	Цена минуты ожидания
	16:	NUMBER32 speedmin,				//	Скорость ниже которой простой
	17:	NUMBER32 timedelayfree			//	Бесплатное время ожидания в секундах
	18:	NUMBER32 timedrivingfree		//	Бесплатное время поездки в секундах
}

typedef ID Rateid
typedef list<Rate> Rates
typedef list<Rateid> Rateids

/*
	Экстренные сообщения
*/
struct Notification
{
	1:	ID id,					//	Identifier
	2:	bool isactive,				// 	false: удален
	3:	DATE msgtime,				// 	false: удален
	4:	PersonRole msgfrom,			// 	От водителя или от диспетчера
	5:	ID driverid,				// 	#Driver Если водитель, то нужно знать от какого водителя. Водитель может отпраить только водителям.
	6:	bool todriver,				//	водителям
	7:	bool tooperator,			//	операторам
	8:	bool topassenger,			//	пассажирам
	9:	bool todispatcher,			//	диспетчерам
	10:	STR note				//	текст
}

typedef ID Notificationid
typedef list<Notification> Notifications
typedef list<Notificationid> Notificationids

/*
	Счета и акты
*/
struct BillAct
{
	1:	ID id,					//	Identifier
	2:	RoleOrgService orgservice,		// 	Кем выставлен счет
	3:	ID customerid,				// 	#Заказчик
	4:	NUMBER32 periodid,			// 	Период времени
	5:	DATE datestart,				// 	От водителя или от диспетчера
	6:	DATE datefinish,			// 	Если водитель, то нужно знать от какого водителя. Водитель может отпраить только водителям.
	7:	CURR total0,				//	Сумма начисления (без скидок)
	8:	CURR total1,				//	Сумма за период
	9:	CURR total2,				//	К оплате
	10:	CURR taxpercent				//	НДС, %
	11:	CURR tax,				//	НДС
	12:	bool hasdiscount,			//	Были скидки
	13:	DATE created,				//	Дата выставления
	14:	bool haspayments,			//	Есть оплаты
	15:	bool paid,				//	Оплачен полностью
	16:	DATE datepaid,				//	Дата последней оплаты
	17:	CURR sumbefore,				//	Остаток до
	18:	CURR sumafter,				//	Остаток после
	19:	STR note				//	текст
	20:	STR billno,				//	Номер счета
	21:	STR actno				//	Номер Акта
}

typedef ID BillActid
typedef list<BillAct> BillActs
typedef list<BillActid> BillActids

/*
	Платежи клиентов
*/
struct Payment
{
	1:	ID id,					//	Identifier
	2:	ID billactid,			// 	Счет и акт
	3:	DATE datereceived,			// 	Дата получения
	4:	DocumentMap document			// 	Документы (квитанция, счет, акт)
}

/*
	Автоматические выставления счетов
*/
struct AutoPayment
{
	1:	ID id,					//	Identifier
	2:	NUMBER32 periodid,				// 	Период времени
	3:	DATE datestart,				// 	период, начало
	4:	DATE datefinish,			// 	период, окончание
	5:	NUMBER32 state				// 	фаза генерации
}

typedef ID AutoPaymentid
typedef list<AutoPayment> AutoPayments
typedef list<AutoPaymentid> AutoPaymentids

/*
	Событие, требующее внимания
*/
struct NotificationEvent
{
	1:	ID id,					//	Identifier
	2:	PersonRole receiverrole,		//	Роль получателя
	3:	ID receiver,				//	driver, passenger id
	4:	STR phone,				//	normalized E.164 phone number, e.g. +7(914)111-2222 -> 7914111222
	5:	PersonRole emitterrole,			//	Роль отправителя
	6:	ID emitter,				//	Identifier отправителя
	7:	OrderStage stage,			// 	Для заказа стадия
	8:	ServiceObject serviceobject,		// 	Объект, требующий внимания
	9:	ServiceAction serviceaction,		// 	Произошедшее действие
	10:	DATE datestart,				// 	Штамп времени, когда произошло или произойдет в будущем
	11:	bool infuture,				// 	Планируемое действие
	12:	ID serviceobjectid,			// 	Идентификатор объекта, требующий внимания
	13:	bool sent,				// 	Удачно отправлено
	14:	DATE sentdate,				// 	Штамп времени, когда отправлено уведомление
	15:	STR notes,				// 	Текстовые пометки
	16:	bool gcmsend,				// 	отправить нотификация driver/passenger
	17:	NUMBER32 gcmsent,			// 	1- Была отправлена нотификация driver/passenger, >1- повторы
	18:	bool isgcmsentsuccess,			// 	Была ли отправлена успешно нотификация driver/passenger
	19:	DATE gcmsentdate,			// 	время последней отправки извещения
	20:	STR gcmresponsecode,			// 	код последнего ответа GCM
	21:	STR gcmresponse				// 	последний ответ GCM (строка JSON обекта)
}

typedef list<NotificationEvent> NotificationEvents

/*
	Exception
	errorcode: application code, 0 if not provided
*/
exception ServiceFailure {
	1:	ErrorType errortype,
	2:	NUMBER32 errorcode,			// код ошибки, 0 если нет
	3:	STR description				// может отсуствовать
}

/*
	Сервис пассажира
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
		Get vehicle
		id: vehicle identifier
	*/
	Vehicle	getVehicle(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Get vehicles by list
		ids: vehicle identifiers
	*/
	Vehicles	getVehicles(1:Credentials credentials, 2: UserDevice userdevice, 3: Vehicleids ids) throws(1: ServiceFailure servicefailure),

	/*
		Get vehicles by driver id
		ids: vehicle identifiers
	*/
	Vehicles	getDriverVehicles(1:Credentials credentials, 2: UserDevice userdevice, 3: Driverid id) throws(1: ServiceFailure servicefailure),

	/*
		Get DictEntry
	*/
	DictEntry	getDictEntry(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Add vehicle to driver id
		id: driver identifier
	*/
	Vehicle	addDriverVehicle(1:Credentials credentials, 2: UserDevice userdevice, 3: Driverid id, 4: Vehicle value) throws(1: ServiceFailure servicefailure),

	/*
		Remove vehicle from driver id
		id: driver identifier
	*/
	void	rmDriverVehicle(1:Credentials credentials, 2: UserDevice userdevice, 3: Driverid id, 4: Vehicleid value) throws(1: ServiceFailure servicefailure),

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
		Add dispatcher account
	*/
	Dispatcher		addDispatcher(1:Credentials credentials, 2: UserDevice userdevice, 3: Dispatcher value) throws(1: ServiceFailure servicefailure),

	/*
		Add driver account
	*/
	Driver		addDriver(1:Credentials credentials, 2: UserDevice userdevice, 3: Driver value) throws(1: ServiceFailure servicefailure),

	/*
		Add Vehicle
	*/
	Vehicle		addVehicle(1:Credentials credentials, 2: UserDevice userdevice, 3: Vehicle value) throws(1: ServiceFailure servicefailure),

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
		Get order
	*/
	ServiceOrder getServiceOrder(1:Credentials credentials, 2: UserDevice userdevice, 3: ID serviceorderid) throws(1: ServiceFailure servicefailure),

	/*
		Get Passenger
	*/
	Passenger getPassenger(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Get Customer
	*/
	Customer getCustomer(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Get Dispatcher
	*/
	Dispatcher getDispatcher(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Get Driver
	*/
	Driver getDriver(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

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
		Remove city
	*/
	void rmCity(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Remove Vehicle
	*/
	void rmVehicle(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

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
	ServiceOrders	findServiceOrder(1:Credentials credentials, 2: UserDevice userdevice, 3: ServiceOrder search, 4: DateRange sheduletime, 5: StageGroup stagegroup, 6: RowRange rowrange) throws(1: ServiceFailure servicefailure),

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
	NotificationEvents getEvents(1:Credentials credentials, 2: UserDevice userdevice, 3: ID startId, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		Driver only, get online on/off
		Return true success, false- service can not set driver offline e.g. driver has active ServiceOrder
	*/
	bool getOnline(1:Credentials credentials, 2: UserDevice userdevice) throws(1: ServiceFailure servicefailure),

	/*
		Driver only, set online on/off
		Return true success, false- service can not set driver offline e.g. driver has active ServiceOrder
	*/
	bool setOnline(1:Credentials credentials, 2: UserDevice userdevice, 3: bool value) throws(1: ServiceFailure servicefailure),

	/*
		Driver & dispatcher only, response to notification event EMITTER_ACCEPTED=-13
		Take order confirm=true
		Take off order confirm=false
		provisionminutes, in minutes
		Return true success, false- service does not send invite to the driver!
	*/
	bool takeOrder(1:Credentials credentials, 2: UserDevice userdevice, 3: ID serviceorderid, 4: bool confirm, 5: NUMBER32 provisionminutes, 6: Driver driver) throws(1: ServiceFailure servicefailure),

	/*
		Driver only, водитель прибыл на место
	*/
	bool startWaiting(1:Credentials credentials, 2: UserDevice userdevice, 3: ID serviceorderid) throws(1: ServiceFailure servicefailure),

	/*
		Driver, Dispatcher only, водитель везет пассажира
		Если вызывает Dispatcher, он должен указать водителя. Указание водителя водителем неопределенно- может в будущем назаначает напарнику
		или бригадир. Водитель нормально не должен указывать этот параметр
	*/
	bool startDriving(1:Credentials credentials, 2: UserDevice userdevice, 3: ID serviceorderid, 4: Driver driver) throws(1: ServiceFailure servicefailure),

	/*
		Driver only, водитель останавливается на остановке
	*/
	bool stopDriving(1:Credentials credentials, 2: UserDevice userdevice, 3: ID serviceorderid) throws(1: ServiceFailure servicefailure),

	/*
		Driver only, водитель завершил поездку
	*/
	bool completeOrder(1:Credentials credentials, 2: UserDevice userdevice, 3: ID serviceorderid) throws(1: ServiceFailure servicefailure),

	/*
		Passenger only, пассажир отменяет заказ
	*/
	bool cancelOrder(1:Credentials credentials, 2: UserDevice userdevice, 3: ID serviceorderid) throws(1: ServiceFailure servicefailure),

	/*
		Driver & DIspactcher only, водитель или за него диспетчер прекращает заказ
	*/
	bool failOrder(1:Credentials credentials, 2: UserDevice userdevice, 3: ID serviceorderid) throws(1: ServiceFailure servicefailure),

	/*
		Driver only, order list
	*/
	ServiceOrders	getDriverServiceOrder(1:Credentials credentials, 2: UserDevice userdevice, 3: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		Passenger only, order list
	*/
	ServiceOrders	getPassengerServiceOrder(1:Credentials credentials, 2: UserDevice userdevice, 3: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
	-----------------------------------------------------------------------------------------------------------------------------------
	*/
	
	/*
		List of AutoPayment
		name: search criteria
	*/
	AutoPayments findAutoPayment(1:Credentials credentials, 2: UserDevice userdevice, 3: AutoPayment search, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of BillAct
		name: search criteria
	*/
	BillActs findBillAct(1:Credentials credentials, 2: UserDevice userdevice, 3: BillAct search, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of DriverBlackList
		name: search criteria
	*/
	DriverBlackLists findDriverBlackList(1:Credentials credentials, 2: UserDevice userdevice, 3: DriverBlackList search, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of Dispatcher
		name: search criteria
	*/
	Dispatchers findDispatcher(1:Credentials credentials, 2: UserDevice userdevice, 3: Dispatcher search, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of Notification
		name: search criteria
	*/
	Notifications findNotification(1:Credentials credentials, 2: UserDevice userdevice, 3: Notification search, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of Shedule
		name: search criteria
	*/
	Shedules findShedule(1:Credentials credentials, 2: UserDevice userdevice, 3: Shedule search, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of ServiceOrderStop
		name: search criteria
	*/
	ServiceOrderStops findServiceOrderStop(1:Credentials credentials, 2: UserDevice userdevice, 3: ServiceOrderStop search, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		List of CustomerStatistic
		name: search criteria
	*/
	CustomerStatistics findCustomerStatistic(1:Credentials credentials, 2: UserDevice userdevice, 3: CustomerStatistic search, 4: RowRange rowrange) throws(1: ServiceFailure servicefailure),

	/*
		Add AutoPayment
	*/
	AutoPayment addAutoPayment(1:Credentials credentials, 2: UserDevice userdevice, 3: AutoPayment value) throws(1: ServiceFailure servicefailure),

	/*
		Add BillAct
	*/
	BillAct addBillAct(1:Credentials credentials, 2: UserDevice userdevice, 3: BillAct value) throws(1: ServiceFailure servicefailure),

	/*
		Add DriverBlackList
	*/
	DriverBlackList addDriverBlackList(1:Credentials credentials, 2: UserDevice userdevice, 3: DriverBlackList value) throws(1: ServiceFailure servicefailure),

	/*
		Add Notification
	*/
	Notification addNotification(1:Credentials credentials, 2: UserDevice userdevice, 3: Notification value) throws(1: ServiceFailure servicefailure),

	/*
		Add Shedule
	*/
	Shedule addShedule(1:Credentials credentials, 2: UserDevice userdevice, 3: Shedule value) throws(1: ServiceFailure servicefailure),

	/*
		Add ServiceOrderStop
	*/
	ServiceOrderStop addServiceOrderStop(1:Credentials credentials, 2: UserDevice userdevice, 3: ServiceOrderStop value) throws(1: ServiceFailure servicefailure),

	/*
		Add CustomerStatistic
	*/
	CustomerStatistic addCustomerStatistic(1:Credentials credentials, 2: UserDevice userdevice, 3: CustomerStatistic value) throws(1: ServiceFailure servicefailure),

	/*
		Remove AutoPayment
	*/
	void rmAutoPayment(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Remove Bank
	*/
	void rmBank(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Remove BillAct
	*/
	void rmBillAct(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Remove Brand
	*/
	void rmVehicleBrand(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Remove Color
	*/
	void rmVehicleColor(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Remove DictEntry
	*/
	void rmDictEntry(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Remove Driver
	*/
	void rmDriver(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Remove DriverBlackList
	*/
	void rmDriverBlackList(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Remove Passenger
	*/
	void rmPassenger(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Remove Notification
	*/
	void rmNotification(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),
		
	/*
		Remove Customer
	*/
	void rmCustomer(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Remove Dispatcher
	*/
	void rmDispatcher(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Remove Shedule
	*/
	void rmShedule(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Remove ServiceOrderStop
	*/
	void rmServiceOrderStop(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

	/*
		Remove CustomerStatistic
	*/
	void rmCustomerStatistic(1:Credentials credentials, 2: UserDevice userdevice, 3: ID id) throws(1: ServiceFailure servicefailure),

}
