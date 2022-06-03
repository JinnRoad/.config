def uuid6(hardware_address=False, node=None, clock_seq=None):
    """Generate a UUID from the current time and the host ID or a random number.
    The implementation works exactly like uuid1 except for two differences:
        1.  The UUID is reorganized to betime-sortable, which is useful for
            database primary keys.
        2.  By default, the uuid1 MAC address is replaced with a PRNG for better
            privacy. If you want the MAC address for the end of your key, use:
                uuid6(hardware_address=True)
    To add this to your python installation, copy this function to the end of
    your uuid.py file, found here:
        ~/.../python/python_version/Lib/uuid.py
    See the links below for the motivation for uuid6 as well as implementations
    in other languages. All the code for this implementation comes from there,
    except for my tweaks to align the uuid6's interface with the uuid module.
        http://gh.peabody.io/uuidv6/
        https://github.com/uuid6/uuid6-ietf-draft
        https://github.com/bradleypeabody/gouuidv6
        https://tools.ietf.org/html/draft-peabody-dispatch-new-uuid-format-00
    Note: This new uuid is not specified by RFC 4122, but as of 2020 is under
    consideration.
    The code below is largely copied from uuid1 so that the performance will
    be essentially the same. Look for "# Changed from uuid1." to see where
    changes have been made.
    If base32 or 64 implementations are needed later, see:
        https://stackoverflow.com/a/63595341
    The specification described at the below link mentions using '-' and '_'
    for base64, as opposed to the often used '=' and '+'.
        https://tools.ietf.org/html/draft-peabody-dispatch-new-uuid-format-00
    """
    uh = uuid1(node, clock_seq).hex
    tlo1 = uh[:5]
    tlo2 = uh[5:8]
    tmid = uh[8:12]
    thig = uh[13:16]
    cloc = uh[16:20]
    node = uh[20:] if hardware_address else os.urandom(6).hex()
    uh6 = thig + tmid + tlo1 + '6' + tlo2 + cloc + node
    return UUID(hex=uh6)
