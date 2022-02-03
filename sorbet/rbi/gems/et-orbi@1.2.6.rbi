# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `et-orbi` gem.
# Please instead update this file by running `bin/tapioca gem et-orbi`.

module EtOrbi
  class << self
    # For `make info`
    def _make_info; end

    # test tool
    def _os_zone; end

    # test tool
    def _os_zone=(_arg0); end

    def centos_tz; end
    def chronic_enabled=(b); end
    def chronic_enabled?; end

    # system tz determination
    def debian_tz; end

    def determine_local_tzone; end
    def extract_zone(str); end
    def gather_tzs; end
    def get_tzone(o); end

    # https://en.wikipedia.org/wiki/ISO_8601
    # Postel's law applies
    def list_iso8601_zones(s); end

    def make(*a); end
    def make_time(*a); end
    def now(zone = T.unsafe(nil)); end
    def os_tz; end
    def osx_tz; end
    def parse(str, opts = T.unsafe(nil)); end
    def platform_info; end
    def render_nozone_time(seconds); end
    def tweak_zone_name(name); end

    # Semi-helpful, since it requires the current time
    def windows_zone_name(zone_name, time); end

    def zone; end

    protected

    def chronic_parse(str, opts); end
    def create_offset_tzone(utc_off, id); end
    def custom_tzs; end
    def determine_local_tzones; end

    # https://api.rubyonrails.org/classes/ActiveSupport/TimeWithZone.html
    #
    # If it responds to #time_zone, then return that time zone.
    def get_as_tzone(t); end

    def get_local_tzone(t); end

    # custom timezones, no DST, just an offset, like "+08:00" or "-01:30"
    def get_offset_tzone(str); end

    def get_tzinfo_tzone(name); end
    def get_x_offset_tzone(str); end
    def make_from_array(a, zone); end
    def make_from_date(d, zone); end
    def make_from_eotime(eot, zone); end
    def make_from_numeric(f, zone); end
    def make_from_string(s, zone); end
    def make_from_time(t, zone); end
    def normalize(name); end
    def to_offset(n); end
    def tz_all; end
    def tzinfo_data_version; end
    def tzinfo_version; end
    def unzz(name); end
    def windows_zone_code_x(zone_name); end
  end
end

# Our EoTime class (which quacks like a ::Time).
#
# An EoTime instance should respond to most of the methods ::Time instances
# respond to. If a method is missing, feel free to open an issue to
# ask (politely) for it. If it makes sense, it'll get added, else
# a workaround will get suggested.
# The immediate workaround is to call #to_t on the EoTime instance to get
# equivalent ::Time instance in the local, current, timezone.
class EtOrbi::EoTime
  def initialize(s, zone); end

  def +(t); end
  def -(t); end
  def <(o); end
  def <=(o); end
  def <=>(o); end
  def ==(o); end

  # Nota Bene:
  #
  # Unlike ==, the equal? method should never be overridden by subclasses
  # as it is used to determine object identity (that is, a.equal?(b) if and
  # only if a is the same object as b)
  #
  # The eql? method returns true if obj and other refer to the same hash key.
  # This is used by Hash to test members for equality.
  def >(o); end

  def >=(o); end
  def add(t); end

  # Returns true if this EoTime instance corresponds to 2 different UTC
  # times.
  # It happens when transitioning from DST to winter time.
  #
  # https://www.timeanddate.com/time/change/usa/new-york?year=2018
  def ambiguous?; end

  def asctime; end
  def day; end

  # Returns this ::EtOrbi::EoTime as a ::Time instance
  # in the current UTC timezone.
  def getgm; end

  # Returns this ::EtOrbi::EoTime as a ::Time instance
  # in the current UTC timezone.
  def getutc; end

  def hour; end
  def in_time_zone(zone = T.unsafe(nil)); end
  def inc(t, dir = T.unsafe(nil)); end
  def is_dst?; end
  def isdst; end
  def iso8601(fraction_digits = T.unsafe(nil)); end
  def localtime(zone = T.unsafe(nil)); end
  def min; end
  def month; end
  def monthdays; end
  def rday; end
  def reach(points); end
  def rweek; end
  def sec; end

  # instance methods
  def seconds; end

  def seconds=(f); end
  def strftime(format); end
  def subtract(t); end
  def to_debug_s; end
  def to_f; end
  def to_i; end

  # Returns this ::EtOrbi::EoTime as a ::Time instance
  # in the current timezone.
  #
  # Has a #to_t alias.
  def to_local_time; end

  def to_s; end

  # Returns this ::EtOrbi::EoTime as a ::Time instance
  # in the current timezone.
  #
  # Has a #to_t alias.
  def to_t; end

  def to_time_s; end

  # Debug current time by showing local time / delta / utc time
  # for example: "0120-7(0820)"
  def to_utc_comparison_s; end

  # Returns this ::EtOrbi::EoTime as a ::Time instance
  # in the current UTC timezone.
  def to_utc_time; end

  def to_zs; end
  def translate(zone = T.unsafe(nil)); end
  def usec; end

  # Returns this ::EtOrbi::EoTime as a ::Time instance
  # in the current UTC timezone.
  def utc; end

  # Returns true if this ::EtOrbi::EoTime instance timezone is UTC.
  # Returns false else.
  def utc?; end

  def utc_offset; end
  def wday; end
  def wday_in_month; end
  def yday; end
  def year; end

  # Returns the value of attribute zone.
  def zone; end

  def zone=(z); end

  protected

  def _to_f(o); end
  def count_weeks(dir); end
  def strfz(code); end

  # Returns a Ruby Time instance.
  #
  # Warning: the timezone of that Time instance will be UTC when used with
  # TZInfo < 2.0.0.
  def to_time; end

  class << self
    def get_tzone(o); end
    def local(*a); end
    def local_tzone; end
    def make(o); end
    def now(zone = T.unsafe(nil)); end
    def parse(str, opts = T.unsafe(nil)); end
    def platform_info; end
    def utc(*a); end
  end
end

EtOrbi::EoTime::DAY_S = T.let(T.unsafe(nil), Integer)
EtOrbi::EoTime::WEEK_S = T.let(T.unsafe(nil), Integer)
EtOrbi::VERSION = T.let(T.unsafe(nil), String)

# https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/default-time-zones
# https://support.microsoft.com/en-ca/help/973627/microsoft-time-zone-index-values
# https://ss64.com/nt/timezones.html
EtOrbi::ZONE_ALIASES = T.let(T.unsafe(nil), Hash)
