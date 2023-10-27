-- Register all Toolbar actions and intialize all UI stuff
function initUi()

  ref = app.registerUi({["menu"] = "Save Current Page", ["callback"] = "onW", ["accelerator"] = "<Control>w"});
  ref = app.registerUi({["menu"] = "Go To Bookmarked Page", ["callback"] = "onI", ["accelerator"] = "<Control>i"});
end


local filename = ".xppbm"

-- Callback if the menu item is executed
function exampleCallback()
	result = app.msgbox("Test123", {[1] = "Yes", [2] = "No"});
  --- print("result = " .. result)
  
	local docStructure = app.getDocumentStructure()
	
	local numPages = #docStructure["pages"]
	local page = docStructure["currentPage"]
	
	while( true )
	do
	   os.execute("timeout " .. tonumber(3))
		--result = app.msgbox("Hallo!", {[1] = "Yes", [2] = "No"});
	end
	
	saveCurrentPage()
	scrollToSavedPage()
end

function onW()
	local docStructure = app.getDocumentStructure()
	if docStructure["currentPage"]~=1 then
		saveCurrentPage()
	else
		scrollToSavedPage()
	end
end

function onI()
	local filereader, err = (io.open(filename, "r"))
	filereader:close()
	
	if filereader then
		scrollToSavedPage()
	else
		saveCurrentPage()
	end
end

function scrollToSavedPage()
	local filereader, err = (io.open(filename, "r"))
	
	if filereader then
		local t = filereader:read("*all")
		
		local loadedpagenumber = tonumber(t)
		
		app.scrollToPage(loadedpagenumber)
	end
	filereader:close()
end


function saveCurrentPage()
	local docStructure = app.getDocumentStructure()
	local f, err = (io.open(filename, "w"))
	local page = docStructure["currentPage"]
	f:write(tostring(page))
	f:close()
	
end