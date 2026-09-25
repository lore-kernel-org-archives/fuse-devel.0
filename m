Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F408046D55C
	for <fuse-devel@lists.linux.dev>; Fri, 25 Sep 2026 22:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790374153; cv=none; b=ZGAkuppOYmjjmoYSTpdvto1p5o6zC/LOBwvGBDosvaT5i1BqzVCd67AanXw2oUJNkzX1jAidUCYLo2hJ1+JHRTdsM5KZf5xTiqQiN59Y9Egwsx51Xy3+E1PN+H32BF9tetuA8FfdGaJth3RZzFHLlwTq6m3Rn9Gemj0B6/GcSGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790374153; c=relaxed/simple;
	bh=wm8Dkb88Z60GmhpWJYRMeUsGB+x1VxL0gaLuLPBHC4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNPOgF7BglWPcvM7zDVI7MlmkYjeoMIxTVHY6ZJ0L0MBGRwfUYuk7GSSvX2eIxDCcpkmFonnaDbiTF8JJ/CyiMQBvAVP7q0k0MiZW3p0s9j1YFCeux/r04I8hFD6y2Saop3C7BGk/jsUtYoFulmJ99RAS5Fqjr0e9Gpq7tn+Evc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q5bATtw4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q5bATtw4"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id CBE6C1F000FF;
	Fri, 25 Sep 2026 22:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790374151;
	bh=WkTmThyQezLlpBV3CRjtU5DQ1qPqtYh2DLjQZ4tr/vY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q5bATtw4Co14yW3ZHeSHIo/yrREGrJtDLObmSgDh/jvllG/X58HVdp8idfRaka3sl
	 TtTLTO+W7ncorxju3ut5giW4Ou/1RdDzqTYjCzTL1zWUM6jo+SpwIS8Qjh5GdFi7Sd
	 v1tGFzqJe0MNkCvBx0llODrsDMVdrm6vAs7Leigc/geE4rWQ3OYWnFtVK7ItVfNkQ+
	 pMR8skV7SyW1wM62Cs7xsnBp2ddmtfPWC5J+XsHH5KNT2Si/A1ko+V4m+H2jGS1dVD
	 a4KP/P0RBKFBJdS6+1bAZ8KURnSF6pDqutVWFv+kxNthC8HO0GAiAutpblKsmAkLTy
	 zHvpH5R/GAGmw==
Date: Fri, 25 Sep 2026 15:09:11 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev
Subject: Re: [PATCH 04/10] util: give fuservicemount3 an absolute build-tree
 runpath
Message-ID: <20260925220911.GT6253@frogsfrogsfrogs>
References: <20260925-mount-service-bound-open-v1-0-bbf1a84c7995@bsbernd.com>
 <20260925-mount-service-bound-open-v1-4-bbf1a84c7995@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-mount-service-bound-open-v1-4-bbf1a84c7995@bsbernd.com>

On Fri, Sep 25, 2026 at 12:23:32AM +0200, Bernd Schubert via B4 Relay wrote:
> From: Bernd Schubert <bernd@bsbernd.com>
> 
> The dynamic loader ignores $ORIGIN runpaths and LD_LIBRARY_PATH for a
> setuid program. A build-tree fuservicemount3 made setuid, for example by
> "run-tests.py --setuid-helpers", then failed with "libfuse3.so.4: cannot
> open shared object file", or loaded the libfuse3.so.4 of the system.
> meson removes build_rpath on install, so installed binaries do not change.

That's a clever trick, I will have to use that. :)

> Assisted-by: LLM
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>

Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  util/meson.build | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/util/meson.build b/util/meson.build
> index 28052a65536f..bc266776e153 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -22,6 +22,8 @@ if private_cfg.get('HAVE_SERVICEMOUNT', false)
>               link_with: [ libfuse ],
>               install: true,
>               install_dir: get_option('sbindir'),
> +             # A setuid run ignores the $ORIGIN runpath meson sets
> +             build_rpath: join_paths(meson.project_build_root(), 'lib'),
>               c_args: ['-DFUSE_USE_VERSION=319'] + mount_service_cflags)
>  endif
>  
> 
> -- 
> 2.53.0
> 
> 
> 
