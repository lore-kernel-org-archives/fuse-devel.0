Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304B4145A1F
	for <fuse-devel@lists.linux.dev>; Tue, 29 Sep 2026 02:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790649255; cv=none; b=tTxZ8YvHBdrKQH1IAWlX9x1tZGSZsbybYxmvjllSLZ7mmSAqjSjwYV8aCek6KZVJx1rorVQRN8/YjLuRrq4PyoVQDhuCrhK0ugNwo1WEP6/qloUEq1/osrCrUN6hsIB0pTo2ZwCAFGKRMuj+ssxDO1qYCyo8n5X0QL940sMZn+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790649255; c=relaxed/simple;
	bh=ronEYY4N4bIo3oP/MukKJfrNF7EsO2GkR2Lvwva9Zis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RaBwzHED84uxkg4meUKsIaxWa7r5mwVmWFOGyuhPu/y7OGRvWic5xjIQYeB+A6SQDWC+aF0EPtdqQ8UbWp7pFviqscVH0IaOy3s8h8oGcbavpVBLPGiLeZ6monLPeDczKKn0ddR7t1J9I/St5Q7mUW9uruqpKWs0oreZFvEe5qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8XmAw7t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8XmAw7t"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id ADB381F000FF;
	Tue, 29 Sep 2026 02:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790649253;
	bh=oI0VzfwtlFfODCW3hZ4lUDMR1X7r/FLGNcUTOU8z1C8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E8XmAw7t+en3wz3zrINLFRcHKsm3Pi+FXI8OSuC+BTAVCh1HABDyeOnJGm+RhQI3l
	 qiKdl1aHd7nI6IrTHMktT8ZVJ4jxW9S3tyep9OnpasEPXcAEqWG0MjDWXvX/mAw7Gi
	 E2FmOPiYAuRf8FAtCsxaWmyi7FEXXyHk9IeY/HgyHsYge/+QUdh3Ub22VIxA4afpFI
	 hCTnPUcDexPbBINFXyhQL2K9m6oyNBZm5v2atKAdwPcvId4mCYBqI0yRIaa1gdcJej
	 L7JRSOyyp0RNewncbSdnD1QkDSbT4fdJ93iMoyc8SqDHU8N++dwp0wnbSdZO/6v3nT
	 fzwjaYcrx2/tA==
Date: Mon, 28 Sep 2026 19:34:13 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev, neal@gompa.dev
Subject: Re: [PATCH v2 13/14] build: move the default service socket
 directory to /run/fuse
Message-ID: <20260929023413.GF6253@frogsfrogsfrogs>
References: <20260928-mount-service-bound-open-v2-0-0f9f501d05ce@bsbernd.com>
 <20260928-mount-service-bound-open-v2-13-0f9f501d05ce@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-mount-service-bound-open-v2-13-0f9f501d05ce@bsbernd.com>

On Mon, Sep 28, 2026 at 01:02:15PM +0200, Bernd Schubert via B4 Relay wrote:
> From: Bernd Schubert <bernd@bsbernd.com>
> 
> /run/fuse sounds better for fuse and then it is also shorter
> a few bytes and might reduce 108-byte AF_UNIX path issues, compared
> to /run/filesystems.
> 
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>

I thought about this once or twice, but then decided that there aren't
any filesystem names that come close to 91 bytes.  That said, it's at
least less typing. :)

Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  meson.build       | 2 +-
>  meson_options.txt | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 06e6056ecf21..5e9628b521e7 100644
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
