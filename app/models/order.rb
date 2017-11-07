class Order < ActiveRecord::Base
	belongs_to :client
	belongs_to :task
	belongs_to :comment 
	belongs_to :site 
	belongs_to :frequency 
	belongs_to :user
	belongs_to :status

	def self.status_choices
		{
		"1" => "In Progress",
        "2" => "Completed", 
        "3" => "Deferred"
		}
	end 

	def self.task_choices
		{		 
		  "1" =>"Identify changes to Pollution Prevention Team",
		  "2" =>"ID changes to non-stormwater discharges",
		  "3" =>"ID changes to inventory of exposed mat'l",
		  "4" =>"Updates to narrative of all potential pollutant sources",
		  "5" =>"Site map update",
		  "6" =>"Spills and Leaks Quarterly Updates Log-Wksht 6",
		  "7" =>"Best Management Practices-Wksht 7",
		  "8" =>"Spill Prevention and response measures-Wksht 8",
		  "9" =>"Maint Prog of Structural Controls: Manifest",
		  "10" =>"Employee Training Program",
		  "11" =>"Rain Gauge Monitoring",
		  "12" =>"Benchmark Monitoring",
		  "13" =>"Site Compliance Evaluation Report-Wksht 13",
		  "14" =>"Program Timeline for Pollution Measures and Control",
		  "15" =>"Five Year Permit Renewal",
		  "16" =>"Periodic Inspection with Checklist-Wksht 16",
		  "17" =>"Daily Monitoring Report of Numeric Effluent",
		  "18" =>"City Engineer Inspection Report Response",
		  "19" =>"Plan revisions log",
		  "20" =>"MSGP copy",
		  "21" =>"SW3P preparation",
		  "22" =>"Spill prevention countermeasue control plan",
		  "23" =>"FMD collaboration",
		  "24" =>"Annual compliance signature page",
		  "25" =>"Visual examination",
		  "26" =>"COH SWQ permit renewal",
		  "27" =>"Truck Wash manifest"
		}
	end

	def self.frequency_choices 
		{
			"1" =>"Quarterly, Instances",
			"2" =>"Daily, Instance",
			"3" =>"Weekly, Instance",
			"4" =>"Monthly, Instance",
			"5" =>"Annual, Instance",
			"6" =>"Instance",
			"7" =>"Semi-Annual, Instance"
		}
	end
	def self.site_choices 
		{
			"1" => "5614 Neches",
  			"2" => "11500 S Post Oak",
  			"3" => "1245 Judiway",
  			"4" => "1502 Central",
  			"5" => "5900 Westpark",
  			"6" => "South ESC",
  			"7" => "10875 SW Freeway",
  			"8" => "2240 Central",
  			"9" => "144000 Sommermeyer",
  			"10" => "5100 Sunbeam"
		}
	end
	def self.client_choices 
		{
  		"1" =>"Chief of Staff",
  		"2" =>"North Assistant Director",
  		"3" =>"South Assistant Director",
  		"4" =>"Southwest Deputy Assistant Director of Collection",
  		"5" =>"Southeast Deputy Assistant Director of Collection",
  		"6" =>"Northeast Deputy Assistant Director of Collection",
  		"7" =>"Northwest Deputy Assistant Director of Collection",
 		"8" =>"Recycling Division Manager",
  		"9" =>"Administrative Manager of SWMD Maintenance",
  		"10" =>"Recycling Division Westpark Superintendent"
		} 
	end 
end 