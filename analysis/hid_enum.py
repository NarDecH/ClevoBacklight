import hid

for d in hid.enumerate():
    print(f"{d['vendor_id']:#06x} {d['product_id']:#06x} "
          f"usage_page={d['usage_page']:#06x} usage={d['usage']:#06x} "
          f"serial={d['serial_number']!r} rel={d['release_number']:#06x} "
          f"product={d['product_string']!r} "
          f"manufacturer={d['manufacturer_string']!r} "
          f"path={d['path']!r}")
