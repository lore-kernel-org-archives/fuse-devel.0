Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921E4328B77
	for <fuse-devel@lists.linux.dev>; Fri,  8 May 2026 23:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778284383; cv=none; b=IYs84DZF8H3NEiVssHQwpEMLu1rKS3cDaDB1A1jdRoyfzq+n8QEPiKTvB2ab50D7LwBFsFtZ4F7eyCB6Zy1VRCsQD56wS08Cxr/CFddkyzxNvFRyvGcC8ezbGV8ZvRrI5daKRX+bwhAKCCagD8D+WbhLEgWUVRaTnR/8kSeOtSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778284383; c=relaxed/simple;
	bh=nrYyCUs944i23tr66R851+JSDGRwSCBo9XIi1SsQnjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P1MspyT8bb+bWxQeHLsLovCdKCYF62Stm6CYiJbggkM4Sc1zLwa0/YelN8DBNkPzNqbZ+G7qnLzNal/us0tBOE5vRuYrC8eI5BXqWq86dTOI9VvF+VMT6+nWXcIz8FUUKpFQUPfMlf/yp5JgcnkUWHbhkLSFjYTTA37zIqjt8Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dVw1/rC/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dVw1/rC/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34354C2BCB0;
	Fri,  8 May 2026 23:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778284383;
	bh=nrYyCUs944i23tr66R851+JSDGRwSCBo9XIi1SsQnjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dVw1/rC/r2cJ1/roKm57YByLHKL9/CGOmpoLEHwzNu7pL5L/aWPzUQBlRCSWDe4/G
	 GSuE4fK9ZWW0zKD0N7V+Qj9OBwcnhfexkHpGpwPZJgziZco2ZwMwKG1Mv3yw9xcxvV
	 mRasp15o1RRRIGHs6A5Habw6iRHo7sPJVGDttDIJf9uSbMKj2oy0Xz4Brom5s3FXAO
	 fqHVdLjPiiBWhfZLH5mxy+ALeTBD/hJt+L/LZ9JCNfFnKfAVIciTrYcGLh47k09tG5
	 ycugXPQgJsc7U6sUcSES5xSK++Wy2Wu8IuBoHr7DfKgE/4nefgQYFOk40lpUBpz6Pa
	 Brt4Si6CqR8nw==
Date: Fri, 8 May 2026 16:53:02 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev
Subject: Re: [PATCH 01/10] test: register pytest run as a meson test
Message-ID: <20260508235302.GG2241589@frogsfrogsfrogs>
References: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
 <20260508-new-mount-fixes-and-tests-v1-1-c67a0893ddbc@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-new-mount-fixes-and-tests-v1-1-c67a0893ddbc@bsbernd.com>

On Fri, May 08, 2026 at 06:39:04PM +0200, Bernd Schubert via B4 Relay wrote:
> From: Bernd Schubert <bernd@bsbernd.com>
> 
> Wire the pytest suite into meson as a single test() so it can be run
> via 'meson test -C build' (or 'meson test -C build pytest -v') instead
> of having to invoke pytest directly. The same definition works for
> both unprivileged and root runs -- invoke 'meson test' as your user,
> or 'sudo -E meson test' to exercise the tests that need root (these
> detect the uid at runtime via os.geteuid()).

Hey, that would be a nice simplification!

Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D


> Assisted by Claude/Opus 4.7
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> ---
>  test/ci-build.sh |  9 ++++++---
>  test/meson.build | 23 +++++++++++++++++++----
>  2 files changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/test/ci-build.sh b/test/ci-build.sh
> index 799f13b2..727cc8c9 100755
> --- a/test/ci-build.sh
> +++ b/test/ci-build.sh
> @@ -2,7 +2,7 @@
>  
>  set -e
>  
> -TEST_CMD="pytest -vv --tb=short --maxfail=1 --log-level=INFO --log-cli-level=INFO test/"
> +TEST_CMD="meson test -C . --print-errorlogs"
>  SAN="-Db_sanitize=address,undefined"
>  
>  # not default
> @@ -122,8 +122,11 @@ sanitized_build()
>      sudo chown root:root util/fusermount3
>      sudo chmod 4755 util/fusermount3
>  
> -    # Test as root and regular user
> -    sudo env PATH=$PATH ${TEST_CMD}
> +    # Test as root and regular user. Give the root run a distinct
> +    # meson log basename so its meson-logs/testlog.* files don't end
> +    # up owned by root and block the subsequent user run from writing
> +    # them.
> +    sudo env PATH=$PATH ${TEST_CMD} --logbase=testlog-root
>      # Cleanup temporary files (since they are now owned by root)
>      sudo rm -rf test/.pytest_cache/ test/__pycache__
>  
> diff --git a/test/meson.build b/test/meson.build
> index 84333f96..87668d61 100644
> --- a/test/meson.build
> +++ b/test/meson.build
> @@ -41,13 +41,28 @@ td += custom_target('test_scripts', input: test_scripts,
>                        command: ['cp', '-fPp',
>                                  '@INPUT@', meson.current_build_dir() ])
>  
> -# Provide something helpful when running 'ninja test'
> -
>  if meson.is_subproject()
>  	test('libfuse is a subproject, skipping tests', executable('wrong_command',
>                        'wrong_command.c', install: false,
>                         c_args: [ '-DMESON_IS_SUBPROJECT' ]))
>  else
> -	test('wrong_command', executable('wrong_command', 'wrong_command.c',
> -                      install: false))
> +	# Run the pytest suite via 'meson test'. The same definition works
> +	# both as a regular user and under sudo: invoke 'meson test -C build'
> +	# for the unprivileged subset, or 'sudo -E meson test -C build' to
> +	# also exercise the tests that require root (they pick the uid up at
> +	# runtime via os.geteuid()).
> +	pytest = find_program('pytest', required: false)
> +	if pytest.found()
> +		test('pytest', pytest,
> +		     args: ['-vv', '--tb=short', '--maxfail=1',
> +		            '--log-level=INFO', '--log-cli-level=INFO',
> +		            meson.current_build_dir()],
> +		     depends: td,
> +		     workdir: meson.project_build_root(),
> +		     timeout: 600,
> +		     is_parallel: false)
> +	else
> +		test('pytest not found', executable('wrong_command',
> +                              'wrong_command.c', install: false))
> +	endif
>  endif
> 
> -- 
> 2.53.0
> 
> 
