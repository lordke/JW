function two() {



function classesChange()
{
    if (xmlhttp.readyState==4)
        {
        if (xmlhttp.status==200)
            {
             var xmldoc=xmlhttp.responseXML;
             
            var content=document.getElementsByClassName('content');
            
            var students=xmldoc.getElementsByTagName('student');
            var tser='';
            var i=0;
           while(i<students.length){
            
                var tstr=tstr+'<tr>'+
                        '<td>'+students[i].getElementsByTagName('id')[0].childNodes[0].nodeValue+'</td>'+
                        '<td>'+students[i].getElementsByTagName('姓名')[0].childNodes[0].nodeValue+'</td>'+
                        '<td>'+students[i].getElementsByTagName('性别')[0].childNodes[0].nodeValue+'</td>'+
                        '<td>'+students[i].getElementsByTagName('班级')[0].childNodes[0].nodeValue+'</td>'+
                        '<td>'+students[i].getElementsByTagName('专业')[0].childNodes[0].nodeValue+'</td>'+
                    '</tr>'
                    
                    i=i+1;
           }

           tstr='<table><thead><tr><th>学号</th><th>姓名</th><th>性别</th><th>班级</th><th>专业</th></tr></thead><tbody>'+tstr+'</tbody></table>';

           console.log(tstr[0]);
           content[0].innerHTML=tstr
           content[0].removeChild(content[0].childNodes[0])


            }
        else
            {
                alert("Problem retrieving XML data");
            }
        }
}

var xmlhttp;
function loadXMLDoc(url)
{
        xmlhttp=null;
        if (window.XMLHttpRequest)
        {
            xmlhttp=new XMLHttpRequest();
        }
        else if (window.ActiveXObject)
        {
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        if (xmlhttp!=null)
        {
            
            xmlhttp.onreadystatechange = classesChange;
            xmlhttp.open("GET",url,true);
            xmlhttp.send(null);

        }
        else
        {
            alert("Your browser does not support XMLHTTP.");
        }
}



var submit = document.getElementById('submit');
var submit2 = document.getElementById('submit2');



submit.addEventListener('click', function(event){
       var name = document.getElementById('name').value;
       event.preventDefault();
       
       loadXMLDoc('http://localhost:6688/students/doquery.jsp?name='+name);

});


submit2.addEventListener('click', function(event){
       var id = document.getElementById('id').value;
       event.preventDefault();
       
       loadXMLDoc('http://localhost:6688/students/doquery.jsp?id='+id);

});




}
window.onload= two


