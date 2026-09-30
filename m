Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D039C4E0B62
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 15:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780993; cv=none; b=VEFANDu58PMHbe45Ya5N81aFhlPRBEEsEBq0HFv39Ex+bBp72Ra6my7OkbKc+H6+ngZzeVYO/5NI0wtVWcEc7clNi7Un6ga6bcaqGAifacNudSUYdk9t7WTGm6qauvHYG6PVZZGtwnwhyD6z28heZSEVGO3xiZCw8jjDr72DP2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780993; c=relaxed/simple;
	bh=TWOKtm1GqQtNJ+2qLEsj6mOvnS/vdNiWjH3UoAXbCMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=epdpWQQZWQVWOo88q858ToZqMrHAHcqhaIKhPNhqsBWM3SOJ1pmeRBUWhWXht9HUIRvDj0FZnRU4oDSMTADG1fL3xRfFNmKdRLpPMH1DksRLwbKk3q9weFmW7Xa6InXkb+J6etxi81qor8a1LTe2O+aOCHGs/oxMwh/+ItkDUDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SPsHsZtv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SPsHsZtv"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 477E01F000FF;
	Wed, 30 Sep 2026 15:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790780984;
	bh=hJfATSfBEd4R7g5eIf2XIT1yTqqZwJFDweurRcjczek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SPsHsZtvwnclY2WGBtmIFdLN2B2x8g24DgPEzWkqf47qQpaQRjPKK2jHNLwFGPck5
	 SPa5cFzwtdhAlisgGpm1I/PkDsaFukH2VTRIHzAEf9b6X2JP2g5GtPJDCNU2y6Vf1/
	 paShVfARz0+gx0YyGrVmkLJ7tjkf+dFsalrBtcyd0Sdb+LGkXJVaOip5tSpMd2Lr1H
	 fNo4NXk+yBYF1xmxlYqxFh1EGhYrEwExjCvJL/oUyKLmypgqRx0rHwzw5DqTtqWIiw
	 T6wjoouASnwUlohhRvDXULxRfeuGlE9gGwSrkwvLY2oJU8PjQunLvNzpK+7w1oH87S
	 8bZDvYP67lVlA==
Date: Wed, 30 Sep 2026 08:09:43 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev, neal@gompa.dev
Subject: Re: [PATCH v3 13/15] build: move the default service socket
 directory to /run/fuse
Message-ID: <20260930150943.GL6253@frogsfrogsfrogs>
References: <20260930-mount-service-bound-open-v3-0-e26c5e4eca4c@bsbernd.com>
 <20260930-mount-service-bound-open-v3-13-e26c5e4eca4c@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-mount-service-bound-open-v3-13-e26c5e4eca4c@bsbernd.com>

On Wed, Sep 30, 2026 at 03:11:07PM +0200, Bernd Schubert via B4 Relay wrote:
> From: Bernd Schubert <bernd@bsbernd.com>
> 
> /run/fuse sounds better for fuse and then it is also shorter
> a few bytes and might reduce 108-byte AF_UNIX path issues, compared
> to /run/filesystems.
> 
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>

Less typing still looks good to me, so
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  meson.build       | 2 +-
>  meson_options.txt | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index c22cc2c1dbf4..eb365ff66552 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -72,7 +72,7 @@ private_cfg.set_quoted('PACKAGE_VERSION', meson.project_version())
>  service_socket_dir = get_option('service-socket-dir')
>  service_socket_perms = get_option('service-socket-perms')
>  if service_socket_dir == ''
> -  service_socket_dir = '/run/filesystems'
> +  service_socket_dir = '/run/fuse'
>  endif
>  if service_socket_perms == ''
>    service_socket_perms = '0220'
> diff --git a/meson_options.txt b/meson_options.txt
> index 43104290f8b5..e12177fcea30 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -35,7 +35,7 @@ option('sync-init', type: 'combo', choices: ['auto', 'always', 'never'], value:
>         description: 'Synchronous FUSE_INIT: auto follows fuse_daemonize_early_start(), always and never override it')
>  
>  option('service-socket-dir', type : 'string', value : '',
> -       description: 'Where to install fuse server sockets (if empty, /run/filesystems)')
> +       description: 'Where to install fuse server sockets (if empty, /run/fuse)')
>  
>  option('service-socket-perms', type : 'string', value : '',
>         description: 'Default fuse server socket permissions (if empty, 0220)')
> 
> -- 
> 2.53.0
> 
> 
> 
