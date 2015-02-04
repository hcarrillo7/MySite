var loginInfo={"acceptedList":[
    {    
        "name": "Horacio Carrillo",
        "email": "carri070@cougars.csusm.edu",
        "password": "password1"
    },
    {    
        "name": "Natalie Armstrong",
        "email": "armst037@cougars.csusm.edu",
        "password": "password1"
    },
    {    
        "name": "Vincent Phongsamran",
        "email": "phong001@cougars.csusm.edu",
        "password": "password1"
    },
    {    
        "name": "Daniel Dier",
        "email": "dyer004@cougars.csusm.edu",
        "password": "password1"
    },	
    {    
        "name": "Joey Babadilla",
        "email": "babad001@cougars.csusm.edu",
        "password": "password1"
    },
    {    
        "name": "admin",
        "email": "admin",
        "password": "admin"
    },
]}

function verifyLogin(inEmail, inPassword)
{
    
    for (var i in loginInfo.acceptedList) 
    {
    
        if (loginInfo.acceptedList[i].email == inEmail)
        {
    
            if (loginInfo.acceptedList[i].password == inPassword)
            {
                
                return i;
            }
            else
                return "false";
        }
    }
}
