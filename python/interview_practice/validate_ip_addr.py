from ipaddress import ip_address
import string

def validate(ip):
    try:
        addr = ip_address(ip)
        return True
    except:
        return False

def my_validate(ip):
    if not ip or type(ip) != type(''):
        return False

    if len(ip.split('.')) == 4:
        version = 4
    elif len(ip.split('::')) > 2:
        return False
    elif 2 < len(ip.split(':')) <= 8:
        version = 6
    else:
        return False

    if version == 4:
        for octet in ip.split('.'):
            try:
                val = int(octet)
                if val < 0 or val > 256:
                    return False
            except:
                return False
        return True
    
    if version == 6:
        for hextet in ip.split(':'):
            try:
                if hextet == "":
                    continue
                if int(hextet, 16) <= int('ffff',16):
                    continue
                else:
                    return False
            except:
                return False
        return True


if __name__ == "__main__":
    print(validate('128.128.128.128') == my_validate('128.128.128.128'))
    print(validate('2001:0db8:85a3:0000:0000:8a2e:0370:7334') == my_validate('2001:0db8:85a3:0000:0000:8a2e:0370:7334'))
    print(validate('2001:0db8:85a3::8a2e:0370:7334') == my_validate('2001:0db8:85a3::8a2e:0370:7334'))
    print(validate('1111.2222.3333.4a44') == my_validate('1111.2222.3333.4a44'))
    print(validate('::') == my_validate('::'))

