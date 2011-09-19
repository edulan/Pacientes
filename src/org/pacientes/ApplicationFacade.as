package org.pacientes
{	
	import org.pacientes.controller.*;
	import org.puremvc.as3.patterns.facade.Facade;

    public class ApplicationFacade extends Facade
    {
		// application
        public static const STARTUP:String = "startup";
        public static const SHUTDOWN:String = "shutdown";
		// notifications
		public static const LOGIN_SUCCEED:String = "loginSucceed";
		public static const LOGIN_FAILED:String = "loginFailed";
		public static const LOGOUT_SUCCEED:String = "logoutSucceed";
		public static const GET_ALL_PATIENTS_SUCCEED:String = "getAllPatientsSucceed";
		public static const GET_ALL_PATIENTS_FAILED:String = "getAllPatientsFailed";
		public static const GET_ALL_PATIENT_REPORTS_SUCCEED:String = "getAllPatientReportsSucceed";
		public static const GET_ALL_PATIENT_REPORTS_FAILED:String = "getAllPatientReportsFailed";
		public static const CREATE_PATIENT_SUCCEED:String = "createPatientSucceed";
		public static const CREATE_PATIENT_FAILED:String = "createPatientFailed";
		public static const SEARCH_PATIENT_SUCCEED:String = "searchPatientSucceed";
		public static const SEARCH_PATIENT_FAILED:String = "searchPatientFailed";
		// command
		public static const COMMAND_LOGIN:String = "commandLogin";
		public static const COMMAND_LOGOUT:String = "commandLogout";
		public static const COMMAND_GET_ALL_PATIENTS:String = "commandGetAllPatients";
		public static const COMMAND_GET_ALL_PATIENT_REPORTS:String = "commandGetAllPatientReports";
		public static const COMMAND_CREATE_PATIENT:String = "commandCreatePatient";
		public static const COMMAND_SEARCH_PATIENT:String = "commandSearchPatient";
		// views
		public static const VIEW_LOGIN_SCREEN:String = "viewLoginScreen";
		public static const VIEW_HOME_SCREEN:String = "viewHomeScreen";

        public static function getInstance():ApplicationFacade {
            if (!instance) { 
				instance = new ApplicationFacade();
			}
            return instance as ApplicationFacade;
        }

        override protected function initializeController():void {
            super.initializeController();
            registerCommand(STARTUP, ApplicationStartupCommand);
			registerCommand(COMMAND_LOGIN, LoginCommand);
			registerCommand(COMMAND_LOGOUT, LogoutCommand);
			registerCommand(COMMAND_GET_ALL_PATIENTS, GetAllPatientsCommand);
			registerCommand(COMMAND_GET_ALL_PATIENT_REPORTS, GetAllPatientReportsCommand);
			registerCommand(COMMAND_CREATE_PATIENT, CreatePatientCommand);
			registerCommand(COMMAND_SEARCH_PATIENT, SearchPatientCommand);
        }
		
		override public function sendNotification(notificationName:String, body:Object=null, type:String=null):void {
			trace("sendNotification (" + notificationName + ")");
			super.sendNotification(notificationName, body, type);
		}

		public function startup(app:Pacientes):void {
			sendNotification(STARTUP, app);
		}
    }
}