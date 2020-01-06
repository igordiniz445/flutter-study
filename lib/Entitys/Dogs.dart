class Dog{
	String _name;
	String _path;
	//Constructor for both atributes
	Dog(this._name, this._path);
	//Empty constructor
	Dog.empty();

	/*Getters and setters*/
	String get name => _name;
	set name(String value) {
		_name = value;
	}

	String get path => _path;
	set path(String value) {
		_path = value;
	}


}