Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81AD4DF4AC
	for <fuse-devel@lists.linux.dev>; Wed, 14 Oct 2026 09:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970850; cv=pass; b=aULqvkwmdhDe5V03rcduQDqbkUEsFzwZm+d/VweVi+iM/EjAdWHg2gxlSUC/fpESBN/51oWN6bKiAr1DFZxwnwaziSPfpSW4awtsNyxH4dF1FO+w2buC5oF3jFtG3jDAUhh7oq0CC0a1nDLroa1h4D/nAvs7jAw/OVTY7jxTA+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970850; c=relaxed/simple;
	bh=9/reRJ/j1yO6b6rjpq4fLoYRPvxibxm3mLaZMWghcMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B3xfK9c4X5CvTv0u/gcsGU2PHbMZKfMzbvtKkMR0c5dB84A2Xk2aR1It5Dg3uggC+VIqBR7JvbFsVTu8JG9VSOoynJjlgaIbLnwdRYDvlLCAnU5TLpvB/SzePyajlFrNUyn+2jCDXkBHw5VUkGgz+zBc2U/vqMCz/hfMk1U9EWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=cDjmFgQl; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="cDjmFgQl"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-53394bffe0fso9015341cf.1
        for <fuse-devel@lists.linux.dev>; Wed, 14 Oct 2026 02:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791970847; cv=none;
        d=google.com; s=arc-20260327;
        b=EXd4oTMp4BMxbenMMIcJGp4NVOfQapC9D7L2MNixIWF+8jzSo+uJowmW2nu0iOhsPL
         Un70aFI5fcvYV5Nct+hui0C7FWJltd2GabmVMmJjugexhbiyPrNZdWLmr1yrmoq5EZtM
         W4ILe45OgZK+jUxCNMQYUs9bEYYUIK8+d95msMcQg3XGgdvlggcemreHuXepAdVDvhOQ
         cisT2YHkqzoiRZ4skzgtLJwXMPNgBgoVK/8sL2YdrZTeBxNZZWFfDn1KfU+1ygk/cmPA
         fTkM+UXLEnldAi3twhYEuoAGjk4zPYxH0uHc/Vpxb88b/ilStaQDbpM9goQEZQKAbl44
         662w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=83H04bxF6YUdzZlLQRh4TGz7SNPkoIlEwePAKgXPMOI=;
        fh=k+QErD4K7cwqMKdJfO/eUaUpsleVqXAmqqyVqQdmuJw=;
        b=XeAD7RJVslyqNT4JBnrx7+oTNKJ4JrP+556E5OqN0hSnjjshI9Bv0TXxW21yg4ZRV5
         TPDb/4mcQmNyo6NHyawBxTxdTXLI45dz+MZKBaadRjbXa931vC6zNCITOJWkJuSwE/uk
         UNGm+inm+d8W87LTt4+ZhSBJD/UOT0puqE/4p4aYtet13fiMUSO8MOlfBc/Zd6gESJxD
         2EmdDEjX+cFG8uY3q0g1C0AXDHrBB/YASxKfOHuM39+g3Lh2FBbEAASIE/tgNFdLCokC
         8yOq4y9MEFpJSKooSfPRAPQlK8D1yNvJkt8i7B4DL1sxpAyVQEZsTtgY/+C1dYvs/CeA
         bl4w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1791970847; x=1792575647; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=83H04bxF6YUdzZlLQRh4TGz7SNPkoIlEwePAKgXPMOI=;
        b=cDjmFgQlMljB1thiwDLfsvb0Jn5WJHHkwY535jaC4wY3oMIdQvOvVwULzfPFL4Spfw
         poCtT3cJGFZtTpkiml6lPHdHOZlebxASGGfdNYJ4BdYLgXRwXkq1pNM4QaoraXTOzyV7
         C6JIwqzTkH8Sy9qLoxjtnpJ8Su6TJSS2X/AQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970847; x=1792575647;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=83H04bxF6YUdzZlLQRh4TGz7SNPkoIlEwePAKgXPMOI=;
        b=KcqIoCccBUnwsbbeAUhdYnNT08pUKmdhVNR6Kw6ZZAb/kDxqT660LnONoHG2HXGo3J
         5b8d36HBg1J37rNmEharQXpe90nXcMYtc0rX1b0NALgjBWFKsGHGW1YrrHCgdawOI3Zw
         ybwYKi/v+WKfiAnSwJKYZqzVsOnFKDlQtokoSCDLViXvwgTQJqKuAEjxzdANm/emNJe2
         tsyZ5JqcUvKQzkuHa14mh82GTqpjyXLD9GxhmhLZiCBV4/tKHRgcwzzJ/Ctj8ibnGSwV
         Fx76PYdFyeQxoOB9i9v+pYTGX9JMNKi/0aoub8QArwj0fr30pgk7WhCtp/a29C7RL6Lw
         cUQg==
X-Forwarded-Encrypted: i=1; AKwUvByvTALuTBUTSwbXNY+uDH3OYXy5lAOKli4+fdFX6kx0qdBFZEg7lqtab6LrPRy25H1uKX83G1Q60XdM@lists.linux.dev
X-Gm-Message-State: AFq9FYLcmshtzAGmH0OhHUzO1vGpxpk6z5HqcRONueiRHDqbxP3mfn4R
	OWwrPmSL/IDRbz8F9fnUIOwfgCk1xFepYc2IgGJmY0GXxJJ/TZbIUONsJq84pYlBXDnsM2O2cUp
	os61Z0CEScsQv8oCIPu5cI7KePBXed73g1x7bvf4PNQ==
X-Gm-Gg: AYBFou0g0JSUC7CTBRBkQrBxt2EXm2wP0LjDJBrKn0XXVqkem+GZEfR5QL9K2OLwcqc
	++eE3f2iDR5OZ1qVFsO4458R6+Zsexk2PiBMgfuzxLk+le1mfzEiJ4fnw4z99EHy6nw+Or6f2iE
	V54PffSEfIsNYHIC3AZsBZFRIzsk88IR7VBZlzjD0VC1/bmCb9bHwE8WuXNiL61PGtYNSZl6/aF
	K2kfd4rwBsilTB8vvpSl0xV3ssxpGzzBpHmk3uZb5oQ634wwGUrhecy+GvvIHNYVnCBFl6NgV/2
	8bs/W8Cp5VK/7vs6c9AnhQ/HeWyBLvm2jEnmOozXBWakraazmbcX/I31ZYb72KK0izXoEjUWEjM
	RWSvHhb4heD9Q9VPYWw==
X-Received: by 2002:a05:622a:305:b0:535:f20:a051 with SMTP id
 d75a77b69052e-535a62041b3mr204309621cf.26.1791970847591; Wed, 14 Oct 2026
 02:40:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008112004.1899560-1-mszeredi@redhat.com> <aswN-UprZHx9wU9y@groves.net>
In-Reply-To: <aswN-UprZHx9wU9y@groves.net>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 14 Oct 2026 11:40:35 +0200
X-Gm-Features: AclHuK-4wYzbPDth2dwaMOE-UcJ9Mlv56Q3DJCgmQBZqmD9Im9s183TZ-SA1hxA
Message-ID: <CAJfpegvDbGaoH5Er78M=XYwA6a7zj6DRqY0+F0cgiD7TfRK_Mg@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] fuse: resolve extent maps in O(1) when possible
To: John Groves <john@groves.net>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	Amir Goldstein <amir73il@gmail.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Oct 2026 at 00:33, John Groves <john@groves.net> wrote:

> With this patch on top of v4 the famfs test suite passes; that tree is
> at [2].  The famfs userspace master branch [1] now works with v4.  If
> the next revision needs further userspace changes, please base them on
> that branch or send them my way so the two don't diverge.

Applied, thanks.

Please next time use a new mail thread, because linking to the old one
confuses b4.

Thanks,
Miklos
