Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE351A6819
	for <fuse-devel@lists.linux.dev>; Sat,  9 May 2026 00:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778286202; cv=none; b=QANrrLG4AyZ/rrGbzkKJGZn13aF+MRI+SOioVBLQzAVJBJgyyUg6BQ0CHGxBDh1MkSnDNp1HTwd+ujkQ8PA69hE8AVP1R/r9g55TaxC/ajEGXf8wMQtFXZZqCqfuFSwEYq2QfmI0QmC6+LADvkWY6eHxP/JNIFrml8oY5EUEtzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778286202; c=relaxed/simple;
	bh=rYqVWCcK97SHCkVIu+eoUil/f0gCqT2cUH4t2OSPtLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPbtNInbgPK5x7GVq5IEGRB3nRTm6NUit2hl7c2ngpVyuukn/qfBTg7bXgZ1IsiZqQs0eCWDMGRBPt7DBPHiiU7YvLW/7fBxtqXre0FRTbh2cfYww9nkgspoKCDin2E2oS6wZWru9zmU2udkCYUwUVuPnyOm6rgnDbatOQizC80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uFG12Xvm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uFG12Xvm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B24C2BCB0;
	Sat,  9 May 2026 00:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778286202;
	bh=rYqVWCcK97SHCkVIu+eoUil/f0gCqT2cUH4t2OSPtLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFG12XvmSyGqy0rRiEkqsa8V8xcloDvY5URJxiJALxq1RICvzLq73aBqs2I7tjoVG
	 OiZUyyOfytliQcVmvaeWcMJblqJ9pLY88W5kKzR6xxkKk6Jau3iMzh7Depy3QGRmVe
	 XVcMSPLdBWC5cHjx0+Dpypn24LWOd6otwuOntw+WylNFrvefDyh00+P7zVpdSFjQ1B
	 VosrH+cA3R7XlOYSHk4g5g2eyofGClqbGZ0NcW2P6ZAgiXSwXbqpE7lbtajFCQuhWo
	 VTJnS57ET3BDiBwDi54YIjuHonQCMSrYwsf19ejqCPV2Gvt7A5Q9zGpIEnb5mSiVRJ
	 nnxINNtF2NuYQ==
Date: Fri, 8 May 2026 17:23:21 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev
Subject: Re: [PATCH 06/10] example: silence add_languages warning by setting
 'native: false'
Message-ID: <20260509002321.GK2241589@frogsfrogsfrogs>
References: <20260508-new-mount-fixes-and-tests-v1-0-c67a0893ddbc@bsbernd.com>
 <20260508-new-mount-fixes-and-tests-v1-6-c67a0893ddbc@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-new-mount-fixes-and-tests-v1-6-c67a0893ddbc@bsbernd.com>

On Fri, May 08, 2026 at 06:39:09PM +0200, Bernd Schubert via B4 Relay wrote:
> From: Bernd Schubert <bernd@bsbernd.com>
> 
> The C++ examples (passthrough_hp, memfs_ll) link against libfuse,
> i.e. there is no cross compilation from example/ point of view.

But doesn't that mean that if libfuse is cross-compiled, then the
examples need to be as well so that they can link against the built
libfuse?

Weirdly it seems ok even with this applied so <shrug> I'll trust you
know meson better than I do :)

Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D


> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> ---
>  example/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/example/meson.build b/example/meson.build
> index 76cf2d96..31e69187 100644
> --- a/example/meson.build
> +++ b/example/meson.build
> @@ -32,7 +32,7 @@ foreach ex : threaded_examples
>                 install: false)
>  endforeach
>  
> -if platform != 'dragonfly' and add_languages('cpp', required : false)
> +if platform != 'dragonfly' and add_languages('cpp', native : false, required : false)
>      executable('passthrough_hp', 'passthrough_hp.cc',
>                 dependencies: [ thread_dep, libfuse_dep ],
>                 install: false)
> 
> -- 
> 2.53.0
> 
> 
