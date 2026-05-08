Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964D036B071
	for <fuse-devel@lists.linux.dev>; Fri,  8 May 2026 23:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778284796; cv=none; b=Ra9DeUG6R4pB9qpT+H0B96QVkzsslRvqYfGMTBwYgQeZem/LCkrGNay+SNkDhWrVvjeaKO2Dm31aOKZxgNqb2HC5pVHC+zV8cWrJ+eZJwZC6WrYKHZBFKzMuFTIJA3iTeY5nrMvONeCjBE5xY/ljZ3S00uVkjpqUdT6Eeg9C8/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778284796; c=relaxed/simple;
	bh=4SKpN5OdzUFMMfSsY1PE5fEF1IBTGaTm0M+Mt6nn02E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0EnxhyPB8rma5OnMfe9BfDmrknqwRI/Yq9GIij48yIwRn65F7KkwsS+x+77x2ys74/gyqtoy2wZl22mRNWgXUaGaLXKDyEO0cuGJBDlxBWrKcIGlqirAMolr6bG/Uk9Ki8JAN8DjGyltW8ik1DGVXr4OCfyQL+lVfd1I41au10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRDVETu1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRDVETu1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A48C2BCB0;
	Fri,  8 May 2026 23:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778284796;
	bh=4SKpN5OdzUFMMfSsY1PE5fEF1IBTGaTm0M+Mt6nn02E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KRDVETu1Mhrae6mM7vIqJI8n31wML/7u8QOVhrj1XgWq1h88/SDCqqI9GAUlvc33n
	 EywFs2lMjvRgXr4sY+wB3xE7fQYtfFYxKRvl6HKzg5J0RfXquFrl8RqVhTRJxuX/YH
	 WqwcVTH9PhEAExrSfq9TlW51dSi9ySjRZmlTB+oU9rDDnN1QE33x1vF8I3gNtFlhIK
	 G7TAeiCCs9nYo2iQrKFad2M/bigPRUaQAFzBqY8wWXNMIbXiky03U4APYn3FASYxv3
	 SBa88F+bQgmtI0iauoDztjrdHXF/0SRAyX4GmDWBCuvwDCFj3tocs7VGfqKpGv9lHQ
	 kzrBazrIkKGXw==
Date: Fri, 8 May 2026 16:59:55 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev
Subject: Re: [PATCH 02/10] Add tests to verify that mountinfo matches
 requested options
Message-ID: <20260508235955.GH2241589@frogsfrogsfrogs>
References: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
 <20260508-new-mount-fixes-and-tests-v1-2-c67a0893ddbc@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260508-new-mount-fixes-and-tests-v1-2-c67a0893ddbc@bsbernd.com>

On Fri, May 08, 2026 at 06:39:05PM +0200, Bernd Schubert via B4 Relay wrote:
> From: Bernd Schubert <bernd@bsbernd.com>
> 
> This is especially for the new mount API, but does not hurt
> either for the traditional API.
> 
> Assisted by Claude Opus 4.7
> 
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> ---
>  test/meson.build         |   3 +-
>  test/test_mount_state.py | 116 +++++++++++++++++++++++++++++++++++++++++++++++
>  test/util.py             |  45 ++++++++++++++++++
>  3 files changed, 163 insertions(+), 1 deletion(-)
> 
> diff --git a/test/meson.build b/test/meson.build
> index 87668d61..55018f92 100644
> --- a/test/meson.build
> +++ b/test/meson.build
> @@ -35,7 +35,8 @@ td += executable('test_loop_config', 'test_loop_config.c',
>                   install: false)
>  
>  test_scripts = [ 'conftest.py', 'pytest.ini', 'test_examples.py',
> -                 'util.py', 'test_ctests.py', 'test_custom_io.py' ]
> +                 'util.py', 'test_ctests.py', 'test_custom_io.py',
> +                 'test_mount_state.py' ]
>  td += custom_target('test_scripts', input: test_scripts,
>                        output: test_scripts, build_by_default: true,
>                        command: ['cp', '-fPp',
> diff --git a/test/test_mount_state.py b/test/test_mount_state.py
> new file mode 100644
> index 00000000..eacb7326
> --- /dev/null
> +++ b/test/test_mount_state.py
> @@ -0,0 +1,116 @@
> +#!/usr/bin/env python3
> +'''
> +Tests that observable mount state (as exposed by /proc/self/mountinfo)
> +matches the options requested at mount time.
> +
> +Existing tests check filesystem behavior (read/write/xattr/...) but
> +never inspect the post-mount metadata recorded by the kernel. That
> +metadata is populated differently by the legacy mount(2) path and the
> +new fsopen/fsconfig/fsmount path, so an option dropped on one path can
> +go undetected — the subtype regression in 5e9e16d6 is one example.
> +These tests assert what /proc/self/mountinfo reports for each mount,
> +so a parity bug between the two paths fails loudly.

That looks pretty useful to me!  I wouldn't even have caught that
mount(8) turns "ro" into MOUNT_ATTR_RDONLY *and* fsconfig(..., "ro") if
you hadn't known that!

Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> +'''
> +
> +if __name__ == '__main__':
> +    import pytest
> +    import sys
> +    sys.exit(pytest.main([__file__] + sys.argv[1:]))
> +
> +import os
> +import subprocess
> +import pytest
> +from contextlib import contextmanager
> +from os.path import join as pjoin
> +from util import (wait_for_mount, umount, cleanup, base_cmdline, basename,
> +                  fuse_test_marker, parse_mountinfo)
> +
> +pytestmark = fuse_test_marker()
> +
> +
> +@contextmanager
> +def hello_mount(tmpdir, output_checker, name, options=()):
> +    mnt_dir = str(tmpdir)
> +    cmdline = base_cmdline + [pjoin(basename, 'example', name),
> +                              '-f', mnt_dir]
> +    if name == 'hello_ll':
> +        cmdline.append('-s')
> +    if options:
> +        cmdline += ['-o', ','.join(options)]
> +    mp = subprocess.Popen(cmdline, stdout=output_checker.fd,
> +                          stderr=output_checker.fd)
> +    try:
> +        wait_for_mount(mp, mnt_dir)
> +        yield mnt_dir
> +    except:
> +        cleanup(mp, mnt_dir)
> +        raise
> +    else:
> +        umount(mp, mnt_dir)
> +
> +
> +@pytest.mark.parametrize('name', ('hello', 'hello_ll'))
> +def test_mountinfo_baseline(tmpdir, output_checker, name):
> +    # libfuse's add_default_subtype() (lib/helper.c) defaults the
> +    # subtype to basename(argv[0]) when the caller didn't pass
> +    # -o fsname=/-o subtype=, so the bare-mount fstype is
> +    # 'fuse.<example-name>', not 'fuse'. The override case is what
> +    # test_mountinfo_subtype below verifies; here we just assert the
> +    # fuse-ness and the standard kernel-side identity options.
> +    with hello_mount(tmpdir, output_checker, name) as mnt:
> +        info = parse_mountinfo(mnt)
> +    assert info is not None, 'mountpoint not found in /proc/self/mountinfo'
> +    assert info['fstype'] in ('fuse', 'fuse.' + name), \
> +        'unexpected fstype %r (expected fuse or fuse.%s)' % \
> +            (info['fstype'], name)
> +    assert any(o.startswith('user_id=')  for o in info['super_options'])
> +    assert any(o.startswith('group_id=') for o in info['super_options'])
> +
> +
> +@pytest.mark.parametrize('name', ('hello', 'hello_ll'))
> +def test_mountinfo_subtype(tmpdir, output_checker, name):
> +    # Regression guard for 5e9e16d6: the new mount API needs an
> +    # explicit fsconfig(SET_STRING,"subtype",...). Without it the
> +    # kernel records fstype=='fuse' (or whatever basename default
> +    # leaks through) instead of the user-requested 'fuse.<subtype>'.
> +    # An explicit -o subtype= must override the basename default.
> +    with hello_mount(tmpdir, output_checker, name,
> +                     ('subtype=mysub',)) as mnt:
> +        info = parse_mountinfo(mnt)
> +    assert info is not None
> +    assert info['fstype'] == 'fuse.mysub', \
> +        'explicit subtype not propagated: fstype=%r' % info['fstype']
> +
> +
> +@pytest.mark.parametrize('name', ('hello', 'hello_ll'))
> +def test_mountinfo_fsname(tmpdir, output_checker, name):
> +    with hello_mount(tmpdir, output_checker, name,
> +                     ('fsname=myfsname',)) as mnt:
> +        info = parse_mountinfo(mnt)
> +    assert info is not None
> +    assert info['source'] == 'myfsname', \
> +        'fsname not propagated: source=%r' % info['source']
> +
> +
> +@pytest.mark.parametrize('name', ('hello', 'hello_ll'))
> +def test_mountinfo_subtype_fsname(tmpdir, output_checker, name):
> +    with hello_mount(tmpdir, output_checker, name,
> +                     ('subtype=mysub', 'fsname=myfsname')) as mnt:
> +        info = parse_mountinfo(mnt)
> +    assert info is not None
> +    assert info['fstype'] == 'fuse.mysub'
> +    # 'mysub#myfsname' is the ENODEV-fallback form when the kernel
> +    # rejects fuse.<subtype>; accept either so the test isn't fragile.
> +    assert info['source'] in ('myfsname', 'mysub#myfsname'), \
> +        'unexpected source: %r' % info['source']
> +
> +
> +@pytest.mark.parametrize('name', ('hello', 'hello_ll'))
> +def test_mountinfo_unprivileged_attrs(tmpdir, output_checker, name):
> +    if os.getuid() == 0:
> +        pytest.skip('only meaningful for unprivileged mounts via fusermount3')
> +    with hello_mount(tmpdir, output_checker, name) as mnt:
> +        info = parse_mountinfo(mnt)
> +    assert info is not None
> +    assert 'nosuid' in info['mount_options']
> +    assert 'nodev'  in info['mount_options']
> diff --git a/test/util.py b/test/util.py
> index 125fd50f..5afaf7d7 100644
> --- a/test/util.py
> +++ b/test/util.py
> @@ -125,6 +125,51 @@ def umount(mount_process, mnt_dir):
>      pytest.fail('mount process did not terminate')
>  
>  
> +def parse_mountinfo(mnt_dir):
> +    '''Return the /proc/self/mountinfo entry for *mnt_dir*, or None.
> +
> +    Parses the line for the mountpoint and returns a dict with keys:
> +      'mountpoint'    - the mount point path (str)
> +      'fstype'        - filesystem type as the kernel sees it,
> +                        e.g. 'fuse' or 'fuse.<subtype>' (str)
> +      'source'        - mount source field, e.g. 'hello' or
> +                        '<subtype>#<fsname>' fallback form (str)
> +      'mount_options' - per-mount options/attrs (set of str), e.g.
> +                        {'rw','nosuid','nodev','noatime','relatime'}
> +      'super_options' - superblock options from the filesystem (set of
> +                        str), e.g. {'rw','user_id=1000','group_id=1000',
> +                        'default_permissions','allow_other','max_read=...'}
> +
> +    These fields are exactly what /proc/self/mountinfo exposes (see
> +    `man 5 proc.5_mountinfo`); they capture the post-mount state that
> +    differs between the legacy mount(2) path and the new fsopen/fsconfig/
> +    fsmount path. Asserting on this dict catches bugs where one path
> +    drops a parameter the other passes (e.g. `subtype` showing up in
> +    `fstype`, `user=` ending up only in /run/mount/utab, ...).
> +    '''
> +    target = os.path.realpath(mnt_dir)
> +    with open('/proc/self/mountinfo') as fh:
> +        for line in fh:
> +            parts = line.rstrip('\n').split(' ')
> +            try:
> +                sep = parts.index('-')
> +            except ValueError:
> +                continue
> +            if len(parts) < sep + 4 or sep < 6:
> +                continue
> +            mountpoint = parts[4].replace('\\040', ' ')
> +            if mountpoint != target:
> +                continue
> +            return {
> +                'mountpoint':    mountpoint,
> +                'fstype':        parts[sep + 1],
> +                'source':        parts[sep + 2].replace('\\040', ' '),
> +                'mount_options': set(parts[5].split(',')),
> +                'super_options': set(parts[sep + 3].split(',')),
> +            }
> +    return None
> +
> +
>  def safe_sleep(secs):
>      '''Like time.sleep(), but sleep for at least *secs*
>  
> 
> -- 
> 2.53.0
> 
> 
