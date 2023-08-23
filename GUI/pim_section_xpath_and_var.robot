
*** Variables ***
${pim_section}     //span[normalize-space()='PIM']
${btn_add_employee}    //button[normalize-space()='Add']
${btn_save}    //button[normalize-space()='Save']
${btn_nextpage_right}    //i[contains(@class,'bi-chevron-right')]
${btn_delete}   //button[normalize-space()='Delete Selected']
${btn_except_delete}    //button[normalize-space()='Yes, Delete']
${btn_save_change}      //p[normalize-space()='* Required']/../button
${btn_search}   //button[normalize-space()='Search']
${dropdown_btn_sort}    //div[text()='Id']//i[contains(@class,'sort-icon')]
${option_ascending}    //div[text()='Id']//span[text()='Ascending']
${table_header_employee_list}    //div[text()='Id']/../..

${menu_item_add_employee}    //a[normalize-space()='Add Employee']
${menu_item_employee_list}    //a[normalize-space()='Employee List']
${menu_item_employee_list}    //a[normalize-space()='Employee List']

${txt_first_name}     //input[@name='firstName']
${txt_last_name}    //input[@name='lastName']
${txt_lastname}    //input[@name='lastName']
${txt_id}    //label[text()='Employee Id']/../following-sibling::div/input
${txt_id_search}    //label[text()='Employee Id']/../..//input
${notice_save_success}    //p[normalize-space()='Successfully Saved']
${xpath_employee_id_fromlist}    //div[@class="oxd-table-card"]//div[2]
${page_number}    //button[contains(@class,'page-item--page')]

${firstname}    Zack
${lastname}     Harison
${new_lastname}     Man