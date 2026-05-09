Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308AE64
	for <fuse-devel@lists.linux.dev>; Sat,  9 May 2026 00:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778285043; cv=none; b=evIua9vmlR9DexU6M9sjSYZoZcf7UKUecLth/2lAMWHPQ3o9Og9MbiEhGhAAqZ+8T5VtM+MPS0y9EQ8Mj0apSFthy2Xul6NaaPtAsjPrUeSyCa43EN8/CLeBI3Q2DpBbZI7e9UQ6/0ZCdcR9d+fJdfTUWRhDPKi1YrlQcG+mTlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778285043; c=relaxed/simple;
	bh=8KFhxqAqlfZmqNeJi3HSnGwBp+r8eInXzSD6b5YXD5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TbrPvdL6F7wwe6OGRH5dVNFi2rZKfab4AGC+Ca2IlDyM3DcBLw/slvuYVDunjj1g0abQNFOQLmVKBP0jWKLOd+1IidkZtm4jmsEtYR/ra5rJ+z0m4yGpB9z7KyuVB1tGUHCOoMyXM5cG86MPuRAyg+IFgEFVQe5ZXjZQS/kBs2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNsb1iGr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNsb1iGr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E3BC2BCB0;
	Sat,  9 May 2026 00:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778285042;
	bh=8KFhxqAqlfZmqNeJi3HSnGwBp+r8eInXzSD6b5YXD5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oNsb1iGrcLPl8GHwOisp7+D4GxGbKSeBl/9IUyWukoScMgQ5m5BVzvUSqWLiDxFee
	 QDA3VxPJF8qz+KJTjJOxTXGe2AQLrLMwCgf0qXNtUxP6wvGG/OKYiq3RTIBRp0YFOT
	 zV9pmR5hgGUYM39MASChMd4WOOTGpAfZv0+6fE8wMPsfXcff3RTFANyDp5KHdKC+6E
	 Mg+/2XvqA7O4o3/VmvaXyNVqiW5/cE3PKTtDAsSe30AhD+vakHSS1VXJG4Xn8P3z11
	 KZeFlabCB5zcvurgsO8m4ho9SnG+Ssxf9dWC8QIrhWQfTXQma8nNJDYtazh9R3Ph0w
	 GLBI4WCFfQBcg==
Date: Fri, 8 May 2026 17:04:02 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev
Subject: Re: [PATCH 03/10] test: assert ro/rw, nosuid/suid, nodev/dev
 round-trip via fsmount
Message-ID: <20260509000402.GI2241589@frogsfrogsfrogs>
References: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
 <20260508-new-mount-fixes-and-tests-v1-3-c67a0893ddbc@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-new-mount-fixes-and-tests-v1-3-c67a0893ddbc@bsbernd.com>

On Fri, May 08, 2026 at 06:39:06PM +0200, Bernd Schubert via B4 Relay wrote:
> From: Bernd Schubert <bernd@bsbernd.com>
> 
> Assisted by ClaudeOpus 4.7
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> ---
>  test/test_mount_state.py | 70 ++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 62 insertions(+), 8 deletions(-)
> 
> diff --git a/test/test_mount_state.py b/test/test_mount_state.py
> index eacb7326..a7949ec3 100644
> --- a/test/test_mount_state.py
> +++ b/test/test_mount_state.py
> @@ -105,12 +105,66 @@ def test_mountinfo_subtype_fsname(tmpdir, output_checker, name):
>          'unexpected source: %r' % info['source']
>  
>  
> -@pytest.mark.parametrize('name', ('hello', 'hello_ll'))
> -def test_mountinfo_unprivileged_attrs(tmpdir, output_checker, name):
> -    if os.getuid() == 0:
> -        pytest.skip('only meaningful for unprivileged mounts via fusermount3')
> -    with hello_mount(tmpdir, output_checker, name) as mnt:
> -        info = parse_mountinfo(mnt)
> +# (label, options, must-be-in mount_options, must-NOT-be-in mount_options)
> +#
> +# Library defaults are MS_NOSUID|MS_NODEV (lib/mount.c:771,
> +# util/fusermount.c:988), so a no-options mount is expected to land
> +# with both attrs set. The negation forms (suid/dev) clear the default
> +# flags via lib/mount.c:set_mount_flag(), which on the new mount API
> +# path means MOUNT_ATTR_NOSUID/MOUNT_ATTR_NODEV are not set in the
> +# fsmount() call. Asserting their absence catches a routing bug where
> +# the negation wasn't honored.
> +ATTR_CASES = [
> +    ('default',  (),          ('rw', 'nosuid', 'nodev'), ('ro',)),
> +    ('ro',       ('ro',),     ('ro',),                   ('rw',)),
> +    ('nosuid',   ('nosuid',), ('nosuid',),               ()),
> +    ('nodev',    ('nodev',),  ('nodev',),                ()),
> +]
> +
> +# suid/dev are root-only: the kernel rejects MS_NOSUID/MS_NODEV being
> +# cleared for unprivileged mounts, and fusermount3 hard-codes them on
> +# anyway (util/fusermount.c:988).
> +ATTR_CASES_ROOT = [
> +    ('suid',     ('suid',),   (),                        ('nosuid',)),
> +    ('dev',      ('dev',),    (),                        ('nodev',)),
> +]
> +
> +
> +def _check_attrs(info, must_have, must_not_have):
>      assert info is not None
> -    assert 'nosuid' in info['mount_options']
> -    assert 'nodev'  in info['mount_options']
> +    for opt in must_have:
> +        assert opt in info['mount_options'], \
> +            '%r missing from mount_options=%r' % (opt, info['mount_options'])
> +    for opt in must_not_have:
> +        assert opt not in info['mount_options'], \
> +            'unexpected %r in mount_options=%r' % (opt, info['mount_options'])
> +
> +
> +@pytest.mark.parametrize('name', ('hello', 'hello_ll'))
> +@pytest.mark.parametrize('label,opts,must_have,must_not_have', ATTR_CASES,
> +                         ids=[c[0] for c in ATTR_CASES])
> +def test_mountinfo_attrs(tmpdir, output_checker, name,
> +                         label, opts, must_have, must_not_have):
> +    with hello_mount(tmpdir, output_checker, name, opts) as mnt:
> +        info = parse_mountinfo(mnt)
> +    _check_attrs(info, must_have, must_not_have)
> +    # ro/rw also surface in super_options; if we asked for ro the
> +    # superblock must agree. Catches a path that sets MOUNT_ATTR_RDONLY
> +    # but forgets the FSCONFIG-side MS_RDONLY (or vice versa).

Ehhh we're probably going to have to fix this again to handle the new
"ro=vfs"/"ro=fs" behaviors that util-linux 2.41 added.

/me is sad that this wasn't all that well publicized on fsdevel:
https://lore.kernel.org/linux-fsdevel/?q=%22ro%3Dvfs%22

The rest of the new tests look ok to me.
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> +    if 'ro' in must_have:
> +        assert 'ro' in info['super_options'], \
> +            'ro on mount but rw on superblock: super_options=%r' % \
> +                info['super_options']
> +
> +
> +@pytest.mark.parametrize('name', ('hello', 'hello_ll'))
> +@pytest.mark.parametrize('label,opts,must_have,must_not_have',
> +                         ATTR_CASES_ROOT,
> +                         ids=[c[0] for c in ATTR_CASES_ROOT])
> +def test_mountinfo_attrs_root(tmpdir, output_checker, name,
> +                              label, opts, must_have, must_not_have):
> +    if os.getuid() != 0:
> +        pytest.skip('clearing nosuid/nodev requires root')
> +    with hello_mount(tmpdir, output_checker, name, opts) as mnt:
> +        info = parse_mountinfo(mnt)
> +    _check_attrs(info, must_have, must_not_have)
> 
> -- 
> 2.53.0
> 
> 
