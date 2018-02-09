// requête 
var oXHR = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');

// requête acceptée
function reportStatus() {
    if (oXHR.readyState == 4)               
        showTheList(this.responseXML);      
}

oXHR.onreadystatechange = reportStatus;
oXHR.open("GET", "../../xml/articlesTAL.xml", true);
oXHR.send();

function showTheList(xml) {

    // div parent
    var divArticles = document.getElementById('articles');        
    // tag xml
    var Art_List = xml.getElementsByTagName('article');       

    // valeurs à afficher
    for (var i = 0; i < Art_List.length; i++) {

        var tablerow = document.createElement('tr');

        var titre = document.createElement('td');
        titre.innerHTML = Art_List[i].getAttribute("titre");
        tablerow.appendChild(titre);

        var auteurs = document.createElement('td');
        auteurs.innerHTML = Art_List[i].getElementsByTagName("auteurs")[0].childNodes[0].nodeValue;
        tablerow.appendChild(auteurs);

        var titre_de_la_source = document.createElement('td');

        // gestion du cas où le titre n'est pas mentionnée
        if(typeof Art_List[i].getElementsByTagName("titre_de_la_source")[0].childNodes[0] !== 'undefined'
            && typeof Art_List[i].getElementsByTagName("titre_de_la_source")[0].childNodes[0].nodeValue !== 'undefined')
        {
            titre_de_la_source.innerHTML = Art_List[i].getElementsByTagName("titre_de_la_source")[0].childNodes[0].nodeValue;
        }
        else 
        {
            titre_de_la_source.innerHTML = '';
        }

        tablerow.appendChild(titre_de_la_source);

        var date_de_publication = document.createElement('td');
        date_de_publication.innerHTML = Art_List[i].getElementsByTagName("date_de_publication")[0].childNodes[0].nodeValue;
        tablerow.appendChild(date_de_publication);

        var lien = document.createElement('td');
        lien.innerHTML = Art_List[i].getElementsByTagName("lien")[0].childNodes[0].nodeValue;
        tablerow.appendChild(lien);

        divArticles.appendChild(tablerow);
    }
};
