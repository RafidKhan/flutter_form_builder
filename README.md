1.
{
    "type": "textfield",
    "title": "Enter Your Name",
    "isRequired": true
}
2.
{
    "type": "radio",
    "title": "Select Gender",
    "options": [],
    "isRequired": false
}
3.
{
    "type": "checkbox",
    "title": "Select Your Skills",
    "options": [],
    "isRequired": true
}

these are the initail objscts coming from api as list/array. In Example:
[
{
    "type": "textfield",
    "title": "Enter Your Name",
    "isRequired": true
},
{
    "type": "radio",
    "title": "Select Gender",
    "options": [],
    "isRequired": false
},
{
    "type": "checkbox",
    "title": "Select Your Skills",
    "options": [],
    "isRequired": true
}
]

For type textfield, there is no predetirmined options. radio and checkbox types have limited options that need to be selected. 

In the model class I have added another field 'fieldValue' which is initially null. 
In textfield widget, on onchange the 'fieldValue' value is being updated. It has dynamic validation as well.
In radio and checkbox widget, on onTap the 'fieldValue' value is being updated. These too have dynamic validation.

Hope this repo helps you to generate form builder.

