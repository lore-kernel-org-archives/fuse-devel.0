Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BD522D4E9
	for <fuse-devel@lists.linux.dev>; Tue, 26 May 2026 14:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807297; cv=pass; b=H8Sb/6D5FTMQEcLXDnLEhvi7kn7VLvPKSAfw/Md0L7T57yflA0NvAb+RsnE2taB4jPdnNZXrYHrRxqXEePVPN6xRADUOVf2+xovPmpjp0maIb/XWl13Bw8Exzi/MTKm1r6wlIVmFG95WGFjWxwco7ohu1IV5Z4d0C9SXFeALUCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807297; c=relaxed/simple;
	bh=AkOucIlmB4Jplha55U+NWq9Hu0uEg/rLFAnM44nrMRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jVbMiBaA7e8XsakkXxDxfBk1STZV2RU1RXiw8P7G/L1Kx6ftiHKLhkiG4o3+t/LTfFbHiWGMzMpdxuA3bHiC9by9USFAW1EqlBQTCLz9+YmfTlUqe0lYM5XCF2oZ8/e48ZJy1reY/Uu6c0jeR4k8NVw/CwRLwvSHsy+mLboYxoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=Tk7F9aOT; arc=pass smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="Tk7F9aOT"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-914bf787977so321594585a.2
        for <fuse-devel@lists.linux.dev>; Tue, 26 May 2026 07:54:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779807295; cv=none;
        d=google.com; s=arc-20240605;
        b=HczGZ+QyJswnG48o70+DoPSl4yJnfefUW43ZvNg++ffkj3FLGTIMPvcGI04s6CNIqq
         z/x+94M58sod2ee+mMEGb3ujDzcE5DreYQLqIHZd4z4CPxQjgXhcDSuHj1V3J+ZdLxS1
         tybOrwd69oUXx3g7h1RsUAS08jmF/LpFmEtPXEvhJualHCQz1QQVNkmrstOAYCK5DRM9
         IyhNRowCnlcS8hSDfAAXrf72i2U+mQk7R8P824kqck53iIaAZ1uualDvXyv8AA7htGvN
         RyO1EjkYyatIFdR7bsuuKnZJlb8mKM1CidLOEtiMFHcA4aY5auPzMvugLwtBT9RSQKPZ
         2Akg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AkOucIlmB4Jplha55U+NWq9Hu0uEg/rLFAnM44nrMRM=;
        fh=R2Y+v4fCgzkcQvXb73rzxp9Juanr3uKmLirQr6T2RLg=;
        b=DFIMPogCUbHv+NA6Vl8Bd3IDWpWvASvMKlrA8wP+JBDk8EWGaHWEpzm3KIzl7pzYnp
         IjN9IfpLDszqQ2VNoCawOhaEj1fGKu1WkHKZWrhX2QNuWDc8hmya7nELfOQKVcxFninU
         ZsUZq9rDOpb9Ccmq4xizh/y2TRhJekzmpZmv+x/YngPgHMmCDA7yRVnzwgv0uJoXm+Mm
         HLajZxf7vKEjskjHi+rFMn1EjGJ9aabUuTJCXf7Vj4DBOJHba8sYbKZGy1EvC84KuCf2
         Yn9XrCQrbLKR1AkVvBb7jbRyMJQ9uLoGqzXve8v/fYHqbTtJV8Mpe+dcLHXT7q2+/DdZ
         M3tQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1779807295; x=1780412095; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AkOucIlmB4Jplha55U+NWq9Hu0uEg/rLFAnM44nrMRM=;
        b=Tk7F9aOTU9xtK9ML0rwgtvxLKtZgy7cJG3hBz5P+dAWOdx4TOzSOZ5yGidjlZGlka2
         gUvzKhZ+kjWF98DoZKU7GaLAAznlfeSN6E1DUNLEavSWDH7K711eo6hTA94Gl6m5xRBe
         bKldVxD2G/vHIaZMHHhhbxsxpn0Ua5i/HlZ6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779807295; x=1780412095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkOucIlmB4Jplha55U+NWq9Hu0uEg/rLFAnM44nrMRM=;
        b=ULsvHOiXFS1dNjS5yOWtfRXGlz/Txa91tboBDLJX8mxfASNqzVbQ4JpaHXzzOUuWjv
         K7e8YWcZRnuVqWNfILedNkUHkPeBfDLiyDJk9HzPw49XazONUJSOPiWRlAdMV3MT38M0
         Xy/hORsQjYb0v+kEFlUhefh5j/0mKmvyUy03I/H0u82vdxR/GMsPhhj2lyxTPbXNhFKW
         wEBf6H2p4lYnhoRQcJ/a/c0i5MeRYroqZb/Zb0gZYdTK/2cnKOK4iEFa77CMWT50UajC
         aFH1VFG4PWxF95tDN4t+tRNcXts2nqCI/M4yIRXAaipp0t1TWzvmG6XV6zxW3GGxglE/
         wcTg==
X-Gm-Message-State: AOJu0YyffC2AHm87B+GOw5O1gA4ipYpQsfs7DMlh8wvgvaYfgqX5fPG+
	9Pp7RMMCk7NxeOA7+3d5cPJRnzG3EwkF/80t3BLej5zRS3r55waKxkZbblwPBQ1oGuyXPKagOw0
	/LQDBSx+XRM8fHZD9OocG9SrL91Ne4UcOzAIuWBJsVw==
X-Gm-Gg: Acq92OGO2E9G1rhsZvVOda203LolhNnQC+Bcw3MLeWnzhdKOE08p4uXv0uD1zDINYZy
	a4GkqbhHWNhtIow9DYaHPfM7+SwuauGKq/d1KjKSZymrHs0+TAel3BoWFqXa9FblulKq7GZxHB3
	s9KM6c7RQS1sOJ6Bzbrg8HCRrJnzJtcruewRbIf26Vps9z9X5SfEr06sWmEN51S7AEknP2H7t2t
	1xg1APUUMfHjX2TX8eW2WYKGHeByK8lEskcNWdBgwOVhRRKY4DnL8JeUa7NDHg3h40dPf+ra+Ut
	v/NbltJ635N6aciChfZ0CWXMiMfqzMh5oS2pKXGKRyQ0dEMNzg==
X-Received: by 2002:a05:620a:2794:b0:910:79bc:606c with SMTP id
 af79cd13be357-914b493782fmr2995044585a.19.1779807294679; Tue, 26 May 2026
 07:54:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260519052807.1924269-1-joannelkoong@gmail.com>
In-Reply-To: <20260519052807.1924269-1-joannelkoong@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 26 May 2026 16:54:43 +0200
X-Gm-Features: AVHnY4I0pTGLEvHzZLiDytHbS7uJ2Wm3LnrlwKLUWZ9BdsG2wkNTFAMaHZOBdJU
Message-ID: <CAJfpeguWcYphxBjfTyPp9vBnPvF6OmgmXvuy_NxYTB6HH0wyHA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] fuse: re-lock request before replacing page cache folio
To: Joanne Koong <joannelkoong@gmail.com>
Cc: fuse-devel@lists.linux.dev, stable@vger.kernel.org, 
	Lei Lu <llfamsec@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 May 2026 at 07:41, Joanne Koong <joannelkoong@gmail.com> wrote:
>
> fuse_try_move_folio() unlocks the request on entry but does not
> re-lock it on the success path. This means fuse_chan_abort() can end the
> request and free the fuse_io_args (eg fuse_readpages_end()) while the
> subsequent copy chain logic after fuse_try_move_folio() accesses the
> fuse_io_args, leading to use-after-free issues.
>
> Fix this by calling lock_request() before replace_page_cache_folio().
> This ensures the request is locked on the success path which will
> prevent the fuse_io_args from being freed while the later copying logic
> runs, and also ensures that the ap->folios[i]->mapping is never null
> since ap->folios[i] will always point to the newfolio after
> replace_page_cache_folio().
>
> Fixes: ce534fb05292 ("fuse: allow splice to move pages")
> Cc: <stable@vger.kernel.org>
> Reported-by: Lei Lu <llfamsec@gmail.com>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>

Looks good, applied both.

Thanks,
Miklos
