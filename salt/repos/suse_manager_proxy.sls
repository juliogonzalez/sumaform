{% if grains.get('role') == 'suse_manager_proxy' %}

{% if '3.2' in grains['product_version'] %}
suse_manager_proxy_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/SUSE:/SLE-12-SP3:/Update:/Products:/Manager32/images/repo/SUSE-Manager-Proxy-3.2-POOL-x86_64-Media1/
    - priority: 97

suse_manager_proxy_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains["mirror"] | default("download.suse.de/ibs", true) }}/SUSE/Updates/SUSE-Manager-Proxy/3.2/x86_64/update/
    - priority: 97
{% endif %}

{% if '4.0' in grains['product_version'] %}
suse_manager_proxy_product_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Products/SLE-Product-SUSE-Manager-Proxy/4.0/x86_64/product/

suse_manager_proxy_product_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Updates/SLE-Product-SUSE-Manager-Proxy/4.0/x86_64/update/

suse_manager_proxy_module_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Products/SLE-Module-SUSE-Manager-Proxy/4.0/x86_64/product/

suse_manager_proxy_module_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Updates/SLE-Module-SUSE-Manager-Proxy/4.0/x86_64/update/

module_server_applications_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Products/SLE-Module-Server-Applications/15-SP1/x86_64/product/

module_server_applications_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Updates/SLE-Module-Server-Applications/15-SP1/x86_64/update/
{% endif %}

{% if 'uyuni-released' in grains['product_version'] %}
suse_manager_proxy_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.opensuse.org", true) }}/repositories/systemsmanagement:/Uyuni:/Stable/images/repo/Uyuni-Proxy-4.0-POOL-x86_64-Media1/
    - priority: 97
{% endif %}

{% if 'head' in grains.get('product_version') or 'uyuni-master' in grains.get('product_version') %}
{% if grains['osfullname'] == 'Leap' %}
suse_manager_proxy_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.opensuse.org", true) }}/repositories/systemsmanagement:/Uyuni:/Master/images-openSUSE_Leap_15.1/repo/Uyuni-Proxy-4.0-POOL-x86_64-Media1/
    - priority: 97
{% else %}
suse_manager_proxy_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/Devel:/Galaxy:/Manager:/Head/images/repo/SLE-Module-SUSE-Manager-Proxy-4.0-POOL-x86_64-Media1/
    - priority: 97
{% endif %}

{% if grains['osfullname'] != 'Leap' %}
suse_manager_devel_releasenotes_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/Devel:/Galaxy:/Manager:/Head:/ToSLE/SLE_15_SP1/
    - priority: 96
{% endif %}

{% if grains['osfullname'] == 'Leap' %}
suse_manager_devel_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.opensuse.org", true) }}/repositories/systemsmanagement:/Uyuni:/Master/openSUSE_Leap_15.1/
    - priority: 96
{% else %}
suse_manager_devel_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/Devel:/Galaxy:/Manager:/Head/SLE_15_SP1/
    - priority: 96
{% endif %}

{% if grains['osfullname'] != 'Leap' %}
module_server_applications_pool_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Products/SLE-Module-Server-Applications/15-SP1/x86_64/product/

module_server_applications_update_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de/ibs", true) }}/SUSE/Updates/SLE-Module-Server-Applications/15-SP1/x86_64/update/

{% endif %}
{% endif %}

{% if '3.2-nightly' in grains['product_version'] %}
suse_manager_devel_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/Devel:/Galaxy:/Manager:/3.2/SLE_12_SP3/
    - priority: 96
{% endif %}

{% if '4.0-nightly' in grains['product_version'] %}
suse_manager_devel_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/Devel:/Galaxy:/Manager:/4.0/SLE_15_SP1/
    - priority: 96

suse_manager_devel_releasenotes_repo:
  pkgrepo.managed:
    - baseurl: http://{{ grains.get("mirror") | default("download.suse.de", true) }}/ibs/Devel:/Galaxy:/Manager:/4.0:/ToSLE/SLE_15_SP1/
    - priority: 96
{% endif %}

{% endif %}

# HACK: work around #10852
{{ sls }}_nop:
  test.nop: []
