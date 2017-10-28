component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

    function run() {
        describe( "Builder pass through requests", function() {
            beforeEach( function() {
                variables.hyper = getInstance( "Builder@Hyper" );
            } );

            afterEach( function() {
                if ( variables.keyExists( "hyper" ) ) {
                    variables.delete( "hyper" );
                }
            } );

            it( "passes through all other methods to the HyperRequest", function() {
                var res = hyper.setUrl( "https://swapi.co/api/people/1" ).get();
                expect( res ).toBeInstanceOf(
                    "HyperResponse",
                    "A HyperResponse object should have been returned."
                );
                var data = res.json();
                expect( data ).toBeStruct(
                    "Expected to deserialize JSON data from the response."
                );
                expect( data ).toBe( {
                    "name": "Luke Skywalker",
                    "height": "172",
                    "mass": "77",
                    "hair_color": "blond",
                    "skin_color": "fair",
                    "eye_color": "blue",
                    "birth_year": "19BBY",
                    "gender": "male",
                    "homeworld": "https://swapi.co/api/planets/1/",
                    "films": [
                        "https://swapi.co/api/films/2/",
                        "https://swapi.co/api/films/6/",
                        "https://swapi.co/api/films/3/",
                        "https://swapi.co/api/films/1/",
                        "https://swapi.co/api/films/7/"
                    ],
                    "species": [
                        "https://swapi.co/api/species/1/"
                    ],
                    "vehicles": [
                        "https://swapi.co/api/vehicles/14/",
                        "https://swapi.co/api/vehicles/30/"
                    ],
                    "starships": [
                        "https://swapi.co/api/starships/12/",
                        "https://swapi.co/api/starships/22/"
                    ],
                    "created": "2014-12-09T13:50:51.644000Z",
                    "edited": "2014-12-20T21:17:56.891000Z",
                    "url": "https://swapi.co/api/people/1/"
                } );
            } );
        } );
    }

}
