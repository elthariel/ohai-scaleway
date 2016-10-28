#
# This Ohai plugin will call the scw-metadata tool available on
# Scaleway's boxes and collect the metadata there
#

scw_metadata = "/usr/local/bin/scw-metadata"

Ohai.plugin(:Scaleway) do
  provides 'scw'

  collect_data do

    if File.exists? scw_metadata
      Ohai::Log.info "Loading Scaleway metdata..."
      cmd = Mixlib::ShellOut.new(scw_metadata, user: 'root').run_command
      if cmd.error?
        msg = "#{scw_metadata} exited with code #{cmd.exitstatus}.\n"
        msg += "stdout:\n#{cmd.stdout}\n"
        msg += "stderr:\n#{cmd.stderr}\n"
        Ohai::Log.warn msg
      else
        scw Mash.new

        cmd.stdout.chomp.split("\n").each do |line|
          items = line.split('=')
          key = items[0].downcase
          value = items[1]

          scw[key.to_sym] = value
          Ohai::Log.debug "Scaleway metadata: found #{key} = #{value}"
        end
      end
    else
      Ohai::Log.warn "#{scw_metadata} not found. Are you on a Scaleway machine?"
    end

  end
end
