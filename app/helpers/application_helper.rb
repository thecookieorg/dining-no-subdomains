module ApplicationHelper
	
	def link_to_add_sizes(name, f, association)
	    new_object = f.object.send(association).klass.new
	    id = new_object.object_id
	    fields = f.fields_for(association, new_object, child_index: id) do |sizes_form_for|
	      render(association.to_s.singularize + "_fields", f: sizes_form_for)
	    end
	    link_to(name, '', class: "add_fields btn btn-primary", data: { id: id, fields: fields.gsub("\n", "")})
	end

	def link_to_add_hours(name, f, association)
		new_object = f.object.send(association).klass.new
		id = new_object.object_id
		fields = f.fields_for(association, new_object, child_index: id) do |hours_form_for|
			render(association.to_s.singularize + "_fields", f: hours_form_for)
		end
		link_to(name, '', class: "add_hours btn btn-primary", data: { id: id, fields: fields.gsub("\n", "")})
	end

end
