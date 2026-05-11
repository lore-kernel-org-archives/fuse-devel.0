Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0214B3B5851
	for <fuse-devel@lists.linux.dev>; Mon, 11 May 2026 20:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778532759; cv=none; b=qUp+X8VN0vnBCP3+w6em3BD1A45JVynFwjRj9bsk025N/MBAQVJStwAjrkKmwHMfqGcsYoiPaT2l7XPKvaBOvRTkLHvu78nFZLXGjw8NHLJY7yjk09RDyrAUF8WN64Kwkfg6uA0i6uT8DTid2Komyi99eBNuO9YHE9AM009Blb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778532759; c=relaxed/simple;
	bh=uz1BipeOxO/kV5AdCXAtVjrhZPFvsFevY1buu71ZRP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A8zUriM27C8tVqiWEOB0Cg1vpcOgGF7qeksZJ9MKdm1kjbGX47j8re1aYt3tMpHh/jWzGJjlsPQGnOOc5nGjMm0Ceef84zc/P8dLR0KwDpZoDfBViIj/uRp2jDg/Ot+kirQq8+WB0PxH6qCh5HG62L+zNMWvm540dMj2kOt6Dh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRHslTWZ; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRHslTWZ"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-67c3cb1433cso8415793a12.0
        for <fuse-devel@lists.linux.dev>; Mon, 11 May 2026 13:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778532755; x=1779137555; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3YsA/sWweaP0g59517piytr1tPPtOa5YFwooaicDPx0=;
        b=TRHslTWZ8DQ397C5ua7op/bsaiApiJpRp9FZXnA+pjqsRNtXwA8NzTMlVU6yJHUWy0
         4Raj56rNIWJrHbZLaZRCVke8Fhr8NClIsJPHIE+wZP0kFxKMHFD+wuchp5AYou4i5SnN
         dVbxgB5DI3XZvhtYHMFiMRz01RD4Uhcagxx18nOfROGWekyB2zVHrwgmBg4bI3n2AkTj
         ngtlOqbdtFEOuKKTjX7wYOoS7iR2hG0cYeANZtv5UWqgtjeF7nUaVdtedygdRUP9RkRH
         5bJCec2Ze6nCVgLjRO1nukecgokpfUXV8JS63zvA0DOYtSm7v4VCWpjbqFBsBdXWTlnD
         BFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778532755; x=1779137555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3YsA/sWweaP0g59517piytr1tPPtOa5YFwooaicDPx0=;
        b=jjTakDeSGAA2pZQPsjsdFV0LHTodFAI80/qLJmXEzrvURArvV2waN1ll1lTuq/GWNU
         ryqJBpeJrdO4lzeaqNyTyG62cKDGMjd7Km2qOtDpMgIWADre5ssIhbcHF+2f+m7Ew/oi
         oGxqGDe6nCxEsFnQyejZpa8bWe7tHkFZJoVgQKHTc06MmJGi7BrDrOul+NJR/qzE4zJH
         d6i52+sDq73SYdrtL5JWcOJKIcwBPe9HlsrV+SVZJ4O3IajBA8V5M4N8Gn79XgLsVwU9
         xyBrtGBLwHxwHmRYwEpHhh7ICoJg/muJVRHPKEQPFjxbuFmsflE3R0hJ0CxWgZBOa/xU
         PmLQ==
X-Forwarded-Encrypted: i=1; AFNElJ+tm436eQWBw8bBZQuEjaEYf10P0wi13VAETH/RstkkndvS7RmI0FJDsZWnHrK/1wc8dlrW66PZJesK@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0HOf9S9It/a/GW8+mQ8nxVg+oqahS8hftxs93DztM2UZ+VytI
	dkdNQ8F0FHari/ZMaD8vdWdDr4UTbnezaISkwOLPqAe5JlyCmLrGN3vQiEl5MomT
X-Gm-Gg: Acq92OFdubcNGSxxFrapAgqeRZGVpddKGCOXLufVVwXYc4sljvbXqhBP4KgtEyvJcCa
	O/f6GHuVf9QiZKxAdqFpaLUt0xQo73B4Yf7QFr7IXTHFyV/N6XkuMHFRgSO+VUw78sIdzvI/Vt6
	NcP72h5p9eFMPDt73rZV+7LTs/PU6UpoFZNiAMOLPoqF8ivi4uLCv2vfh1RgFo+R2z3fDkvsOTe
	4SqAnkyb/QrzhIuv0cwsLU8OTNQSCD1Sv8A794TAxvxbxtWPdnChZS/BPL+LqqLk6uBtaGMnLq4
	A6KQV+UCNDZgZAei27J3c6aIk/PSlDyt2M5dGi07T/6CCnlXx6slu3jCe1h/Wn7SkYqgr4Ct6Qz
	ixziti/QrMhkmuw1Aukg/f5OrrMx8AR+iRNDoVnG5aDxs826eGJtNU4v9eQkxVelM/rfn5pu8Cz
	4F+K76xebHmVrhKLL54bD6zcQV5o0ZniorjYVrKCungZ1BeyxHq2mdmI6bTkoquIzScB7v02BaI
	Fx9mDd9VUDOF/OGtNOhyALUXiU=
X-Received: by 2002:a17:907:c002:b0:bd0:39ba:8f60 with SMTP id a640c23a62f3a-bd039c9d5b5mr358958766b.39.1778532755368;
        Mon, 11 May 2026 13:52:35 -0700 (PDT)
Received: from localhost (2001-1c00-570d-ee00-8e87-6a4e-f2be-0c04.cable.dynamic.v6.ziggo.nl. [2001:1c00:570d:ee00:8e87:6a4e:f2be:c04])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac3989fbesm546407866b.33.2026.05.11.13.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 13:52:34 -0700 (PDT)
Date: Mon, 11 May 2026 22:52:34 +0200
From: Amir Goldstein <amir73il@gmail.com>
To: zhaoguohan@kylinos.cn
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev
Subject: Re: [PATCH] fuse: use current creds for backing files
Message-ID: <agJBkmecYOl1MEgS@amir-ThinkPad-T480>
References: <20260510145437.321141-1-zhaoguohan@kylinos.cn>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510145437.321141-1-zhaoguohan@kylinos.cn>

On Sun, May 10, 2026 at 10:54:37PM +0800, zhaoguohan@kylinos.cn wrote:
> From: GuoHan Zhao <zhaoguohan@kylinos.cn>
> 
> FUSE backing files only need a stable snapshot of the current credentials
> for later backing-file I/O. prepare_creds() allocates a mutable copy and
> can fail, but this code never modifies or commits the result.
> 
> Use get_current_cred() instead and store it as a const pointer. This
> matches the rest of the backing-file helpers and avoids an unnecessary
> allocation and failure path.
> 
> Signed-off-by: GuoHan Zhao <zhaoguohan@kylinos.cn>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  fs/fuse/backing.c | 2 +-
>  fs/fuse/fuse_i.h  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
> index d95dfa48483f..8efb43b17c4d 100644
> --- a/fs/fuse/backing.c
> +++ b/fs/fuse/backing.c
> @@ -118,7 +118,7 @@ int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map)
>  		goto out_fput;
>  
>  	fb->file = file;
> -	fb->cred = prepare_creds();
> +	fb->cred = get_current_cred();
>  	refcount_set(&fb->count, 1);
>  
>  	res = fuse_backing_id_alloc(fc, fb);
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 17423d4e3cfa..36041e405bf8 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -106,7 +106,7 @@ struct fuse_submount_lookup {
>  /** Container for data related to mapping to backing file */
>  struct fuse_backing {
>  	struct file *file;
> -	struct cred *cred;
> +	const struct cred *cred;
>  
>  	/** refcount */
>  	refcount_t count;
> -- 
> 2.43.0
