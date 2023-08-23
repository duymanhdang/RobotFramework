*** Variables ***
${element_admin_section}    //span[normalize-space()='Admin']
${recruitment_section}    //span[text()='Recruitment']
${maintenance_section}    //span[text()='Maintenance']
${btn_add_user}    //button[normalize-space()='Add']
${btn_save_adduser}    //button[normalize-space()='Save']

${txt_employeename_adduser}    //label[text()='Employee Name']/../following-sibling::div//input
${txt_username_adduser}    //label[text()='Username']/../following-sibling::div//input
${txt_password_adduser}    //label[text()='Password']/../following-sibling::div//input
${txt_confirm_password_adduser}    //label[text()='Confirm Password']/../following-sibling::div//input
${txt_current_password}    //label[text()='Current Password']/../following-sibling::div/input
${txt_password_change}    //label[text()='Password']/../following-sibling::div//input
${txt_confirm_password_change}    //label[text()='Confirm Password']/../following-sibling::div//input

${usermenu}    //li[contains(@class,'userdropdown')]
${option_logout}    //a[text()='Logout']
${option_change_password}    //a[text()='Change Password']

${dropdownlist_userrole_adduser}    //label[text()='User Role']/../following-sibling::div
${dropdownlist_status_adduser}    //label[text()='Status']/../following-sibling::div
${dropdown_name_adduser}    //div[@role='listbox']
${list_status_option}    //div[@role='listbox']
${list_userrole_option}    //div[@role='listbox']
${option_ESS_adduser}    //span[text()='ESS']
${option_Enable_adduser}    //span[text()='Enabled']
${xpath_username_fromlist}    //div[contains(@class,'oxd-table-body')]//div[2]
${xpath_list_section}    //ul[@class='oxd-main-menu']//span

${user_already_exists}    //span[text()='Already exists']
${result_username_list}    //span[contains(normalize-space(),'Records Found')]
${header_adduser}    //h6[text()='Add User']
${header_dashboard}    //h6[text()='Dashboard']
${notice_loginfail}    //p[text()='Invalid credentials']
${notice_save_success}    //p[text()='Successfully Saved']

${employee_name_adduser}    Zack Harison
${username_user}    harison
${password_user}    ess12345
${password_change}    esschange123
