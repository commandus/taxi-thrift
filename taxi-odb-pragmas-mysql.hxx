#pragma db value(taxi::STR) type ("VARCHAR(255)")

#pragma db object(taxi::City)
#pragma db member(taxi::City::id) id auto
#pragma db value(taxi::_City__isset) type ("BINARY(64)")

// #pragma db value(taxi::DictEntry)
#pragma db object(taxi::DictEntry)
#pragma db member(taxi::DictEntry::id) id auto
// #pragma db member(taxi::DictEntry::__isset) readonly
#pragma db value(taxi::_DictEntry__isset) type ("BINARY(64)")

#pragma db value(taxi::PassengerLimit)
// #pragma db object(taxi::PassengerLimit)
// #pragma db member(taxi::PassengerLimit::id) id auto
#pragma db value(taxi::_PassengerLimit__isset) type ("BINARY(64)")

#pragma db value(taxi::PassengerUsage)
// #pragma db object(taxi::PassengerUsage)
// #pragma db member(taxi::PassengerUsage::id) id auto
#pragma db value(taxi::_PassengerUsage__isset) type ("BINARY(64)")

#pragma db value(taxi::UserDevice)
#pragma db value(taxi::_UserDevice__isset) type ("BINARY(64)")

#pragma db value(taxi::Credentials)
#pragma db value(taxi::_Credentials__isset) type ("BINARY(64)")

// #pragma db object(taxi::Person)
// #pragma db member(taxi::Person::id) id auto
#pragma db value(taxi::Person)
#pragma db value(taxi::_Person__isset) type ("BINARY(64)")

// #pragma db value(taxi::Bank)
#pragma db object(taxi::Bank)
#pragma db member(taxi::Bank::id) id auto
#pragma db value(taxi::_Bank__isset) type ("BINARY(64)")

#pragma db value(taxi::GeoLocation)
#pragma db value(taxi::_GeoLocation__isset) type ("BINARY(64)")

#pragma db value(taxi::Location)
#pragma db value(taxi::_Location__isset) type ("BINARY(64)")

// #pragma db value(taxi::Org)
#pragma db object(taxi::Org)
#pragma db member(taxi::Org::id) id auto
#pragma db value(taxi::_Org__isset) type ("BINARY(64)")

// #pragma db value(taxi::OrgService)
#pragma db object(taxi::OrgService)
#pragma db member(taxi::OrgService::id) id auto
#pragma db value(taxi::_OrgService__isset) type ("BINARY(64)")

// #pragma db value(taxi::Customer)
#pragma db object(taxi::Customer)
#pragma db member(taxi::Customer::id) id auto
#pragma db value(taxi::_Customer__isset) type ("BINARY(64)")

// #pragma db value(taxi::Passenger)
#pragma db object(taxi::Passenger)
#pragma db member(taxi::Passenger::id) id auto
#pragma db value(taxi::_Passenger__isset) type ("BINARY(64)")
#pragma db index(taxi::Passenger::"idx_passenger_cityid") member (cityid) 
#pragma db index(taxi::Passenger::"idx_passenger_customerid") member (customerid) 

// #pragma db value(taxi::Vehicle)
#pragma db object(taxi::Vehicle)
#pragma db member(taxi::Vehicle::id) id auto
#pragma db value(taxi::_Vehicle__isset) type ("BINARY(64)")

#pragma db value(taxi::Payload)
#pragma db value(taxi::_Payload__isset) type ("BINARY(64)")

// #pragma db value(taxi::Document)
#pragma db object(taxi::Document)
#pragma db member(taxi::Document::id) id auto
#pragma db value(taxi::_Document__isset) type ("BINARY(64)")

#pragma db object(taxi::Manager)
#pragma db member(taxi::Manager::id) id auto
#pragma db value(taxi::_Manager__isset) type ("BINARY(64)")

// #pragma db value(taxi::Driver)
#pragma db object(taxi::Driver)
#pragma db member(taxi::Driver::id) id auto
#pragma db value(taxi::_Driver__isset) type ("BINARY(64)")
#pragma db index(taxi::Driver::"idx_driver_cityid") member (cityid) 

// #pragma db value(taxi::Dispatcher)
#pragma db object(taxi::Dispatcher)
#pragma db member(taxi::Dispatcher::id) id auto
#pragma db value(taxi::_Dispatcher__isset) type ("BINARY(64)")

// #pragma db value(taxi::ServiceOrder)
#pragma db object(taxi::ServiceOrder)
#pragma db member(taxi::ServiceOrder::id) id auto
#pragma db value(taxi::_ServiceOrder__isset) type ("BINARY(64)")
#pragma db index(taxi::ServiceOrder::"idx_serviceorder_stage") member (stage) 
#pragma db index(taxi::ServiceOrder::"idx_serviceorder_created") member (created) 
#pragma db index(taxi::ServiceOrder::"idx_serviceorder_cityid") member (cityid) 
#pragma db index(taxi::ServiceOrder::"idx_serviceorder_passengerid") member (passengerid) 
#pragma db index(taxi::ServiceOrder::"idx_serviceorder_ordertype") member (ordertype) 
#pragma db index(taxi::ServiceOrder::"idx_serviceorder_iscalculated") member (iscalculated) 

// #pragma db value(taxi::ServiceOrderStop)
#pragma db object(taxi::ServiceOrderStop)
#pragma db member(taxi::ServiceOrderStop::id) id auto
#pragma db value(taxi::_ServiceOrderStop__isset) type ("BINARY(64)")

#pragma db object(taxi::ServiceOrderDecline)
#pragma db member(taxi::ServiceOrderDecline::id) id auto
#pragma db value(taxi::_ServiceOrderDecline__isset) type ("BINARY(64)")

#pragma db object(taxi::Claim)
#pragma db member(taxi::Claim::id) id auto
#pragma db value(taxi::_Claim__isset) type ("BINARY(64)")

#pragma db object(taxi::Track)
#pragma db member(taxi::Track::id) id auto
#pragma db value(taxi::_Track__isset) type ("BINARY(64)")

#pragma db value(taxi::SheduleDays)
#pragma db value(taxi::_SheduleDays__isset) type ("BINARY(64)")

// #pragma db value(taxi::Shedule)
#pragma db object(taxi::Shedule)
#pragma db member(taxi::Shedule::id) id auto
#pragma db value(taxi::_Shedule__isset) type ("BINARY(64)")

#pragma db object(taxi::DriverBlackList)
#pragma db member(taxi::DriverBlackList::id) id auto
#pragma db value(taxi::_DriverBlackList__isset) type ("BINARY(64)")

#pragma db object(taxi::SheduleStop)
#pragma db member(taxi::SheduleStop::id) id auto
#pragma db value(taxi::_SheduleStop__isset) type ("BINARY(64)")

#pragma db object(taxi::Rate)
#pragma db member(taxi::Rate::id) id auto
#pragma db value(taxi::_Rate__isset) type ("BINARY(64)")

#pragma db object(taxi::TariffPlan)
#pragma db member(taxi::TariffPlan::id) id auto
#pragma db value(taxi::_TariffPlan__isset) type ("BINARY(64)")

#pragma db object(taxi::Notification)
#pragma db member(taxi::Notification::id) id auto
#pragma db value(taxi::_Notification__isset) type ("BINARY(64)")

// #pragma db value(taxi::BillAct)
#pragma db object(taxi::BillAct)
#pragma db member(taxi::BillAct::id) id auto
#pragma db value(taxi::_BillAct__isset) type ("BINARY(64)")

#pragma db object(taxi::Payment)
#pragma db member(taxi::Payment::id) id auto
#pragma db value(taxi::_Payment__isset) type ("BINARY(64)")

#pragma db object(taxi::AutoPayment)
#pragma db member(taxi::AutoPayment::id) id auto
#pragma db value(taxi::_AutoPayment__isset) type ("BINARY(64)")

#pragma db object(taxi::NotificationEvent)
#pragma db member(taxi::NotificationEvent::id) id auto
#pragma db value(taxi::_NotificationEvent__isset) type ("BINARY(64)")

#pragma db index(taxi::Passenger::"idx_passenger_phone1") member (person.phone1) 
#pragma db index(taxi::Manager::"idx_manager_phone1") member (person.phone1) 
#pragma db index(taxi::Driver::"idx_driver_phone1") member (person.phone1) 
#pragma db index(taxi::Dispatcher::"idx_dispatcher_phone1") member (person.phone1) 
#pragma db object(taxi::CustomerStatistic)
#pragma db member(taxi::CustomerStatistic::id) id auto
#pragma db value(taxi::_CustomerStatistic__isset) type ("BINARY(64)")
#pragma db index(taxi::CustomerStatistic::"idx_customerstatistic_customerid") member (customerid) 

/*
	See taxi_odb_traits.hxx 
*/

#pragma db member(taxi::City::__isset) transient
#pragma db member(taxi::Location::__isset) transient
#pragma db member(taxi::GeoLocation::__isset) transient
#pragma db member(taxi::UserDevice::__isset) transient
#pragma db member(taxi::Credentials::__isset) transient
#pragma db member(taxi::DictEntry::__isset) transient
#pragma db member(taxi::Bank::__isset) transient
#pragma db member(taxi::Org::__isset) transient
#pragma db member(taxi::OrgService::__isset) transient
#pragma db member(taxi::Person::__isset) transient
#pragma db member(taxi::Customer::__isset) transient
#pragma db member(taxi::Passenger::__isset) transient
#pragma db member(taxi::PassengerLimit::__isset) transient
#pragma db member(taxi::PassengerUsage::__isset) transient
#pragma db member(taxi::Payload::__isset) transient
#pragma db member(taxi::Vehicle::__isset) transient
#pragma db member(taxi::Document::__isset) transient
#pragma db member(taxi::Driver::__isset) transient
#pragma db member(taxi::Dispatcher::__isset) transient
#pragma db member(taxi::ServiceOrder::__isset) transient
#pragma db member(taxi::ServiceOrderStop::__isset) transient
#pragma db member(taxi::ServiceOrderDecline::__isset) transient
#pragma db member(taxi::Claim::__isset) transient
#pragma db member(taxi::Track::__isset) transient
#pragma db member(taxi::Shedule::__isset) transient
#pragma db member(taxi::SheduleDays::__isset) transient
#pragma db member(taxi::SheduleStop::__isset) transient
#pragma db member(taxi::DriverBlackList::__isset) transient
#pragma db member(taxi::Rate::__isset) transient
#pragma db member(taxi::Notification::__isset) transient
#pragma db member(taxi::BillAct::__isset) transient
#pragma db member(taxi::Payment::__isset) transient
#pragma db member(taxi::AutoPayment::__isset) transient
#pragma db member(taxi::CustomerStatistic::__isset) transient
