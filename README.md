
# Baiss Api

Il s'agit d'une api pour faire des appeles api en toute simplicité.



## Configuration

Après l'installation du package, vous aurez besoin de créer tout à la racine du projet, un fichier "env.json".

Il s'agit du fichier où nos configurations seront renseignées.

Il se présente comme suit :


### Fichier env.json

```javascript
{
    "APP_PROD_ENV"   :   bool,           // Il du type d'environnement de votre projet (production ou developpement)

    "API_PROD_BASE_URL"   :   "lien",    // Il s'agit de votre lien api de production
    "API_DEV_BASE_URL"    :   "lien",    // Il s'agit de votre lien api de developpement
    "API_CONNECT_TIMEOUT" :   10000,     // Il s'agit du temp d'attente  pour l'envoi de requete (10s par défaut)
    "API_RECEIVE_TIMEOUT" :   10000      // Il s'agit du temp d'attente  pour la réception du retour de la requete (10s par défaut)
}
```
Une fois la base d'URL ainsi définies dans votre fichier json, vous n'aurez plus qu'à passer le endpoint en paramètre au helper utilisé en fonction de votre type de requête.
## Exemple d'utilisation

### Requete en get

Voici quelques exemples d'utilisation du package

```bash
import 'package:api/baiss_api.dart';

get_data() async {
    var res = await apiGet('posts');
}
```

### Requete en post

Voici quelques exemples d'utilisation du package

```bash
import 'package:api/baiss_api.dart';

get_data() async {
    var res = await apiPost('posts');
}
```


### Requete en delete

Voici quelques exemples d'utilisation du package

```bash
import 'package:api/baiss_api.dart';

get_data() async {
    var res = await apiDelete('posts');
}
```

## Retours

### Succès
En cas de succès, le retour se présente comme suit :

```bash
{
    'data': result,
    'status': result.statusCode
}
```

### Erreur
En cas d'erreur, le retour se présente comme suit :


```bash
{
    'data': e,
    'status': e.response!.statusCode,
    'error': e.response,
}
```