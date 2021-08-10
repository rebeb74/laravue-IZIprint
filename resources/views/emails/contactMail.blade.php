<!DOCTYPE html>
<html>
<head>
    <title>Contact IZIprint.re</title>
</head>
<body>
    <h4>Un utilisateur vous envoie un message depuis le formulaire de contact IZIprint.re</h4>
    <p>Prénom : {{ $details['firstname'] }}</p>
    <p>Nom : {{ $details['lastname'] }}</p>
    <p>Entreprise : {{ $details['company'] }}</p>
    <p>email : {{ $details['email'] }}</p>
    <p>Téléphone : {{ $details['phone'] }}</p>
    <p>Message : {{ $details['content'] }}</p>
   
</body>
</html>