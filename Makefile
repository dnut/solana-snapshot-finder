prefix := "/usr/local"
_data := $(prefix)/share/snapshot-finder

install:
	mkdir $(_data)
	cp snapshot-finder.py $(_data)/snapshot-finder.py
	python -m venv $(_data)/venv
	$(_data)/venv/bin/pip install -r requirements.txt
	echo '#!/usr/bin/env bash' > $(prefix)/bin/snapshot-finder
	echo '$(_data)/venv/bin/python $(_data)/snapshot-finder.py $$@' >> $(prefix)/bin/snapshot-finder
	chmod +x $(prefix)/bin/snapshot-finder

uninstall:
	rm -r $(_data)
	rm $(prefix)/bin/snapshot-finder

user-%: 
	$(MAKE) $* prefix="${HOME}/.local"
