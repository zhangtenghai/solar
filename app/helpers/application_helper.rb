# encoding: utf-8
module ApplicationHelper
  ActionView::Base.default_form_builder = CustomFormBuilder

  def page_title
    case params[:action]
    when "edit", "update"
      "修改"
    when "index"
      "列表"
    when "new", "create"
      "添加"
    end
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields btn default btn-xs black pull-right", data: { id: id, fields: fields.gsub("\n", "")})
  end

  def link_to_device_add_row(name, f)
    id = f.object.object_id
    fields = render("device_fields", f: f)
    link_to(name, '#', class: "add_rows btn default btn-xs black pull-right", id: "device_add_row", data: { id: id, fields: fields.gsub("\n", "")})
  end

  def link_to_attachment_add_row(name, f)
    id = f.object.object_id
    fields = render("attachment_fields", f: f)
    link_to(name, '#', class: "add_rows btn default btn-xs black pull-right", id: "attachment_add_row", data: { id: id, fields: fields.gsub("\n", "")})
  end


  def omission_td(length, *data)
    str = data.join('')
    omission_has = str.length > length
    omission_str = omission_has ? str[0,length]+'...' : str
    if omission_has
      content_tag(:td, :class => 'tooltips',:data => { :container=>'body', :placement=>'top', 'original-title' => str }) do
        omission_str
      end
    else
      content_tag(:td) do
        omission_str
      end
    end
  end

  def omission_td_before(length, *data)
    str = data.join('')
    omission_has = str.length > length
    omission_str = omission_has ? '...' + str[str.length-6,length] : str
    if omission_has
      content_tag(:td, :class => 'tooltips',:data => { :container=>'body', :placement=>'top', 'original-title' => str }) do
        omission_str
      end
    else
      content_tag(:td) do
        omission_str
      end
    end
  end
  
end
