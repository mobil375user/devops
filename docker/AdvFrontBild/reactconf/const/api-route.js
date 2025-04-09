export const SERVER = process.env.NODE_ENV === 'development' ? process.env.REACT_APP_DEV_API_URL : 'https://edms.edosrv.mda'
export const AUTH_URI = '/auth';
const API = '/api';
const VERSION = '/v2'

export const OTT_API_ROUTE = '/ott';
export const GTB_ORG_API_ROUTE = '/sed-org';

export const AUTH_API_URL = `${SERVER}${AUTH_URI}/dev-auth`;
export const AUTH_API_PROD_URL = `${SERVER}${AUTH_URI}/spnego`;
export const SERVER_API_ROUTE = `${SERVER}${API}`;

export const AUTH_BASIC_API_ROUTE = `${AUTH_URI}/basic`;
export const AUTH_REFRESH_TOKEN_API_ROUTE = `${AUTH_URI}/refresh-token`;

export const REGISTER_FIRST_USER_API_ROUTE = `${AUTH_URI}/first-user`;

export const EMPLOYEE_API_ROUTE = '/employee';
export const EMPLOYEE_ME_API_ROUTE = `${EMPLOYEE_API_ROUTE}/me`;
export const IO_EMPLOYEE_API_ROUTE = `${EMPLOYEE_API_ROUTE}/io`;
export const AUTHORIZATION_DATES_API_ROUTE = `/authorization-dates`;

// Search templates
export const SEARCH_TEMPLATE_API_ROUTE = 'filter';

// Avatar start
export const PUBLIC_RESOURCES_ROUTE = '/public-resources';
export const AVATAR_API_ROUTE = '/avatar';
export const AVATAR_SMALL_API_ROUTE = '/avatar_small';
// Avatar end

// Directories start
// Setup start
export const MAIL_SETUP_API_ROUTE = '/mail-setup';
export const RECOGNITION_SETUP_API_ROUTE = '/recognition-setup';
export const GENERAL_SETUP_API_ROUTE = '/general-setup';
export const REMINDER_API_ROUTE = '/reminder-rule';
export const NOTIFICATION_API_ROUTE = '/notification-rule';
export const GENERAL_SETUP_ALL_ORG_API_ROUTE = `${GENERAL_SETUP_API_ROUTE}/all-org`;
// Setup end
export const CALENDAR_API_ROUTE = '/calendar';
export const CALENDAR_WEEKENDS_API_ROUTE = `${CALENDAR_API_ROUTE}/weekends`;
export const CALENDAR_DAY_ROUND_DOWN_API_ROUTE = `${CALENDAR_API_ROUTE}/day-round-down`;

// User calendar start
export const USER_CALENDAR_API_ROUTE = '/user-calendar'
export const USER_CALENDAR_DOCUMENT_API_ROUTE = `${USER_CALENDAR_API_ROUTE}/document`;
export const USER_CALENDAR_TASK_API_ROUTE = `${USER_CALENDAR_API_ROUTE}/task`;
export const USER_CALENDAR_WEEKEND_API_ROUTE = `${CALENDAR_API_ROUTE}/year`;
export const USER_CALENDAR_URL_API_ROUTE = `${USER_CALENDAR_API_ROUTE}/ical-export`
// User calendar end

export const TYPICAL_SUMMARY_API_ROUTE = '/typical-summary';

export const TYPICAL_CONTROL_POINTS_API_ROUTE ="/typical-control-points"

export const ROLE_API_ROUTE = '/role';
export const ROLE_API_ROUTE_V2 = '/role/v2';
export const ROLE_ALL_API_ROUTE = `${ROLE_API_ROUTE}/all`;

export const GROUP_API_ROUTE = '/group';
export const GROUP_API_ROUTE_V2 = '/group/v2';
export const GROUP_EMPLOYEE_ALL_API_ROUTE = `${GROUP_API_ROUTE}/employee/all`;

export const CORRESPONDENT_API_ROUTE = '/correspondent';
export const CORRESPONDENT_API_ROUTE_V2 = '/correspondent/v2';

export const CORRESPONDENT_CONTACT_INFO_API_ROUTE = '/contact-face';

export const SUBJECT_API_ROUTE = '/subject';

export const CORRESPONDENT_GROUP_API_ROUTE = '/correspondent-group';
export const CORRESPONDENT_GROUP_API_ROUTE_V2 = '/correspondent-group/v2';

export const INTERMEDIATE_CORRESPONDENT_API_ROUTE = '/intermediate-correspondent';

export const TYPICAL_SUMMARY_TASK_API_ROUTE = '/typical-summary-task';

export const CURRENCIES_API_ROUTE = '/currency';

export const ADDITIONAL_DOCUMENT_TYPE_API_ROUTE = '/additional-document-type';

export const DELIVERY_METHOD_API_ROUTE = '/delivery-method';

export const POST_API_ROUTE = '/post';

export const DOC_PROFILE_API_ROUTE = '/doc-profile';

export const REGISTRATION_JOURNAL_API_ROUTE = '/reg-journal';

export const REGISTRATION_JOURNAL_RESET_COUNTER_API_ROUTE = `${REGISTRATION_JOURNAL_API_ROUTE}/reset-counter`;

export const CONTROL_TYPE_API_ROUTE = '/control-type';

export const APPEAL_TYPE_API_ROUTE = '/citizen-type';

export const REPORT_API_ROUTE = '/report';

export const REPORT_API_ROUTE_V2 = '/report/v2';

export const REPORT_USER_CONFIG_API_ROUTE = '/report-user-config';

export const DISTRICT_API_ROUTE = '/district';


export const REGION_API_ROUTE = '/region';

export const REGION_TREE_API_ROUTE = `${REGION_API_ROUTE}/tree`;

export const CITY_API_ROUTE = '/city';

export const COUNTRY_API_ROUTE = '/country';

export const FOLDER_API_ROUTE = '/folder';

export const FOLDER_NEW_API_ROUTE = `${VERSION}/folder`

export const NOMENCLATURE_AFFAIR_API_ROUTE = '/nomenclature-affair';

export const NOMENCLATURE_INNER_INVENTORY_API_ROUTE = '/inner-inventory';

export const ACCEPTANCE_INVENTORY_API_ROUTE = '/acceptance-inventory';

export const ACCEPTANCE_NCES_API_ROUTE = '/nces';

export const USER_GROUP_API_ROUTE = '/group';

export const DEPARTMENT_API_ROUTE = '/department';

export const SOLUTION_RESULT_API_ROUTE = '/solution-result';

export const DOCUMENT_TYPE_API_ROUTE = '/document-type';

export const STORAGE_PERIOD_API_ROUTE = '/storage-period';

export const INVESTMENT_PROGRAM_API_ROUTE = '/investment-program';

export const TEMPLATE_API_ROUTE = '/template';
export const TEMPLATE_CONTRACT_API_ROUTE = '/template-contract';

export const TEMPLATE_API_ROUTE_V2 = '/template/v2';
export const TEMPLATE_TEMPORARY_ATTACHMENT_API_ROUTE = '/temporary-attachment';
export const TEMPLATE_FILE_API_ROUTE = '/file';
export const TEMPLATE_FILE_DOWNLOAD_API_ROUTE = '/download';

export const DOCUMENT_ROUTE_API_ROUTE = '/route';
export const DOCUMENT_ROUTE_BPMN_API_ROUTE = '/bpmn';
export const ROUTE_PROCESS_ITEM_DEFINITIONS_API_ROUTE = `${DOCUMENT_ROUTE_API_ROUTE}/process-item-definitions`;
export const ROUTE_PROCESS_ITEM_DEFINITIONS_API_ROUTE_V2 = `${DOCUMENT_ROUTE_API_ROUTE}/v2/process-item-definitions`;

export const ERROR_HISTORY_API_ROUTE = '/error-history';

export const AISMV_ROUTER_CONFIG_API_ROUTE = '/aismv-router-config';
export const AISMV_API_CONFIG_API_ROUTE = '/aismv-api-config';
export const OAIS_APIM_AUTH_CONFIG_API_ROUTE = '/oais-apim-auth-config';

export const OAIS_SMDO_SUBSCRIBER_CONFIG_API_ROUTE = '/oais-smdo-subscriber-config';
export const OAIS_SMDO_SED_TYPE_CONFIG_API_ROUTE = '/oais-smdo-sed-type-config';
export const OAIS_SMDO_FILE_TYPE_CONFIG_API_ROUTE = '/oais-smdo-file-type-config';
export const OAIS_SMDO_DOC_TYPE_CONFIG_API_ROUTE = '/oais-smdo-doc-type-config';

export const AISMV_RECYCLE_SETTINGS_API_ROUTE  = '/aismv-recycle-settings';

export const AISMV_CERT_INFO_API_ROUTE = '/aismv-cert-info';

export const ACTIVE_DIRECTORY_SETTING_API_ROUTE = "/ad-config";

export const NCES_API_ROUTE = '/nces';
export const NCES_ARCHIVE_API_ROUTE = `/nces-archive`;
export const NCES_ARCHIVE_REGISTRATION_API_ROUTE = `${NCES_API_ROUTE}/registration`;
export const NCES_ARCHIVE_CONFIG_API_ROUTE = `${NCES_ARCHIVE_API_ROUTE}/config`;

export const TEMPLATE_RKK_SETUP_API_ROUTE = '/template-rkk-setup';

export const MIGRATION_SETUP_API_ROUTE = '/migration-setup';
// Directories end

//Permission
export const PERMISSION_API_ROUTE = '/permission';
export const PERMISSION_SYSTEM_NAME_API_ROUTE = `${PERMISSION_API_ROUTE}/system-name`;
export const RELOAD_PERMISSIONS_API_ROUTE = `${PERMISSION_API_ROUTE}/reload`
//Permission end


//History
export const ENTITY_HISTORY_API_ROUTE = '/entity-history';
export const LONG_ID_API_ROUTE = '/long-id';
export const UUID_ID_API_ROUTE = '/uuid-id';
export const STRING_ID_API_ROUTE = '/string-id';
//History End


//Document
export const DOCUMENT_API_ROUTE = '/document';
export const DOCUMENT_START_API_ROUTE = `${DOCUMENT_API_ROUTE}/start`;
export const DOCUMENT_PROCESS_NEXT_API_ROUTE = `${DOCUMENT_API_ROUTE}/process/next`;
export const DOCUMENT_CANCEL_API_ROUTE = `${DOCUMENT_API_ROUTE}/cancel`;
export const DOCUMENT_LINK_API_ROUTE = `/document-link`;
//DocumentEnd

//DocumentChat
export const DOCUMENT_COMMENT_API_ROUTE = '/document-comment';
//DocumentEnd

//Document full text search
export const DOCUMENT_FULL_TEXT_SEARCH = '/full-search'

//Task
export const TASK_API_ROUTE = '/task';
export const TASK_KANBAN_API_ROUTE = `${TASK_API_ROUTE}/kanban`;

//TaskProject
export const TASK_PROJECT_API_ROUTE = '/task-project';


// Document widget
export const DOCUMENT_COUNT_API_ROUTE = '/count/document';
export const DOCUMENT_STAT_API_ROUTE = `${DOCUMENT_API_ROUTE}/stat`;
// DocumentEnd widget

// Task widget
export const TASK_STAT_API_ROUTE = `${TASK_API_ROUTE}/stat`;

export const TASK_STAT_EXECUTION_PERIOD_API_ROUTE = `${TASK_STAT_API_ROUTE}/execution-period`;
//TaskEnd widget

// todoList widget
export const TODO_LIST_API_ROUTE = "/user-home-dashboard-todolist"
//end todoList widget

// calendar widget
export const CALENDAR_WIDGET_API_ROUTE = "/user-calendar"

//Битые
export const ERROR_AUTH_API_URL = `${SERVER}/error-auth`;
export const ACCESS_ERROR_API_ROUTE = `/access-error`;

//ЭЦП
export const EDS_LOCALE_SERVER_API_ROUTE = 'http://127.0.0.1:8084';
export const EDS_LOCALE_SIGN_API_ROUTE = '/sign';
export const EDS_LOCALE_VERIFY_CMS_API_ROUTE = '/verify_cms';
export const EDS_LOCALE_SIGN_KTA_CMS_API_ROUTE = '/sign_kta_cms';


//Вне дырки
export const AUTH_DEV_EMPLOYEE = `${AUTH_API_URL}/employee`;

// Персональные настройки начало
export const PERSONAL_SETUP_API_ROUTE = '/personal-setup';
//scan
export const SCAN_SETTING_API_ROUTE = `${PERSONAL_SETUP_API_ROUTE}/scan`;
//attachment
export const PERSONAL_SETUP_ATTACHMENT_API_ROUTE = `${PERSONAL_SETUP_API_ROUTE}/attachment`;
// Персональные настройки конец

//scan
export const SCAN_UTILITY_SCAN_API_ROUTE = '/scan';
export const SCAN_UTILITY_SCANNER_LIST_API_ROUTE = '/scanner-list';
export const SCAN_UTILITY_SERVER = 'http://127.0.0.1:9009';

export const SCAN_UTILITY_SCAN_V2_API_ROUTE = '/api/v1/Scanner';
export const SCAN_UTILITY_SERVER_V2 = 'http://localhost:61234';
// export const SCAN_UTILITY_SERVER = 'http://172.20.4.64:9009';


//Socket
export const SERVER_WS_API_ROUTE = `${SERVER}/ws`;
export const EDMS_DOCUMENT_WS_ROUTE = '/edms/document';
export const HEARTBEAT_WS_ROUTE = `/app/heartbeat`;
export const EDMS_USER_WS_ROUTE = `/edms/user`;


//user notification
export const USER_NOTIFICATION_API_ROUTE = 'user-notification';
export const USER_NOTIFICATION_STAT_API_ROUTE = `${USER_NOTIFICATION_API_ROUTE}/stat`;
export const USER_NOTIFICATION_READ_API_ROUTE = `${USER_NOTIFICATION_API_ROUTE}/read`;
export const USER_NOTIFICATION_UNREAD_API_ROUTE = `${USER_NOTIFICATION_API_ROUTE}/unread`;


//print permission in access control page
export const ACCESS_CONTROL_PAGE_PRINT_PERMISSION = 'permission';

// AISMV NSI DIRECTORIES
export const OAIS_SMDO_SUBSCRIBER_API_ROUTE = `/oais-smdo-subscriber`;
export const OAIS_SMDO_SED_TYPE_API_ROUTE = `/oais-smdo-sed-type`;
export const OAIS_SMDO_FILE_TYPE_API_ROUTE = `/oais-smdo-file-type`;
export const OAIS_SMDO_DOC_TYPE_API_ROUTE = `/oais-smdo-doc-type`;
export const OAIS_SMDO_INCOMING_PACKAGES_API_ROUTE = `/aismv-org-package`;

// Menu sidebar counter
export const DOCUMENT_ALL_COUNT_API_ROUTE = `/count/document`;
export const DOCUMENT_INTRODUCTION_COUNT_API_ROUTE = `${DOCUMENT_ALL_COUNT_API_ROUTE}/introduction`;
export const DOCUMENT_ADDITIONAL_AGREEMENT_COUNT_API_ROUTE = `${DOCUMENT_ALL_COUNT_API_ROUTE}/additional-agreement`;
export const DOCUMENT_FOR_SENDING_TO_ROUTE_COUNT_API_ROUTE = `${DOCUMENT_ALL_COUNT_API_ROUTE}/for-sending-to-rout`;
export const DOCUMENT_IN_WORK_COUNT_API_ROUTE = `${DOCUMENT_ALL_COUNT_API_ROUTE}/in-work`;

export const TASK_ALL_COUNT_API_ROUTE = `/count/task`;
// End menu sidebar counter


export const USER_ACTION_API_ROUTE = `/user-action`;
export const USER_ACTION_PANEL_API_ROUTE = `/user-action-panel`;


export const LATEST_DOCUMENT_API_ROUTE = `/latest-document`;

// OFFICE
export const ONLY_OFFICE_URI = `/integration/onlyoffice`


export const INFO_API_MODULES = '/info'

export const USER_BASIC_ACCOUNT_API_ROUTE = '/user-basic-account'

export const USER_HOME_DASHBOARD_API_ROUTE = '/user-home-dashboard'

export const USER_AD_ACCOUNT_API_ROUTE  = "/user-ad-account"

