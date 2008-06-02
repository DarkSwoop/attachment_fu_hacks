# Include hook code here
klass = Technoweenie::AttachmentFu::InstanceMethods
klass.module_eval do
  def local_file=(path)
    raise 'Path doesn\'t exist...' unless File.exists?(path)
    self.content_type = File.mime_type?(path)
    self.filename     = File.basename(path)
    self.temp_path = path
  end
end