Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C97415F22
	for <fuse-devel@lists.linux.dev>; Mon, 24 Aug 2026 13:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787577248; cv=pass; b=PmMEIPw6uFYGVluEpVDcNg0Co4iAkVSwHvapyaVvxxhmAC+qCpOo1OEbW7M8rTpuGqXZZa0aGBnmcB75Pt3syfWs5M74IPXP94V9Nlb6mnxEeU0aXefg7D88kjO7fzLQ+yPYaHbyQmEU1ys7edwcBZ7vDoQ72Mm8TUyXp21bxrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787577248; c=relaxed/simple;
	bh=CzMHD3unGU/ezDMcqvC3UC+o6FZUdHEIyrpiZIAg+gc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZkufilBPW46sVmg8raSIXYul+CKUMGsn/vB9udN+LhoRNxAYwAAtnrYXNF1FrTQ0sGm8ctep2dE/ICeE80vw0SROp8NM1hJEyVNKTFjGIxs2JRy7iiX9QmlxE/mD3fAJFUuCEY41OeQM9C3WK6i+24JcVBxHQc7RjpxJXjoWs9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=PdTxuChD; arc=pass smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="PdTxuChD"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92e6391b114so248188085a.3
        for <fuse-devel@lists.linux.dev>; Mon, 24 Aug 2026 06:14:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787577246; cv=none;
        d=google.com; s=arc-20260327;
        b=qMG0YWFmMhKOesvndSPpiD6lZg3gy35yBsCAZh/qfqmMryM2Y3FgD2CTB602/hZ5A+
         z9C7X2qamjLagmgRhfoZyTd8ve8t2j2Zh9nUcIaPp+Dd3c7AliXr6TDCpeegaSEVBwZE
         CmL+a+li6467xhxbJXVtMcd7ARnOEbCPG0pHjpcFDdzhyoJYEKUWdYCadRdxl2DzNhU/
         jx7Ug8uoy4jnegWaFGFlWETZFpgYY83Y+L4Ia0cn2k2L1Fxb1UT8ysP64c5riZVdTrrj
         6ESlwv8VDSMX/vjH6gr+4JlX5X9prmp6Y5vXvvALYH4LcKcYo5/5Tgs68jBOMWFTGG+C
         dMUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qGGLhKIHK8dGCQLwKjMU7h4rFU3X17jfPSxCogOt6Gc=;
        fh=5cucsUd2CNI6mcb0hGWK0k0oeFUAEbRFQnYlgYmkYyw=;
        b=AxWVUp2mCGvvegoO9TZ4pwHOJsHWh1jPMdbYVshxui8qC8LystYPnuMvCWkKyIepbV
         J1fnEKoojhXTAzMaBL8ezFMfF56cZQgTDAokxH/p0Ag3jtr/AQ4YLI30KuMSRGosHM81
         uWIqvMHH7ItqRelrbJN0Uotjtq/ayut/7OtmOah/dAwj40z+/fA6QuHZm/Oh2LA9IJwl
         hbtTvtF8i+YFOEWCFaTWnbxcNy1RgKeOUX7yKUqr99AHUUB7eYvOIwkYLLoALXglJFXp
         8HKYXWPcGRM4UF9kVkyZ/PMZUIHT7LhmdLSOehJ2TnwPrzWSpiB7pjUMP6DWQNhPYSJT
         /hqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787577246; x=1788182046; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGGLhKIHK8dGCQLwKjMU7h4rFU3X17jfPSxCogOt6Gc=;
        b=PdTxuChDrOen0GxSdlCEhLlZYTW62EsHGA+xJ+5rOO7nBtW+eY0EmsZY6jhkVAHbW3
         Bu2Xuzc4xHsxhkr7PSzIZpXYYMkD1ADFHZYh1swgYGYptTzpI7V+P9DAzhi3pxiKeVeZ
         EThojz00a3EdRBKdf5fYM59XugECh2gQyvoXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787577246; x=1788182046;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qGGLhKIHK8dGCQLwKjMU7h4rFU3X17jfPSxCogOt6Gc=;
        b=X1+5OCt56Y1xRvlx3eagR5T3HZgfDEHN8asBDH3ditbdIBezubVzUDdv4HeATNv81p
         I/WN5MRe/aoYAWViLEMk7T0Dj70CvVSSbvx3PGQ6Jh+cHjSNrce/b/2++KK6ZXSAJ1z/
         yy5gHpTUx+VN/1KlRLOIje2FHmIwcu223sif7JgeasVX6RR35pncvpNHZlnyS+2GE7WU
         pirYpyB8bqCVV9qCV9Jyb/4I+ajZCqeoQe2rTxiou113rLcFpJpOc+I2EU302B4myPNH
         56jrniV5ANWqrN7OV4ilMHcfcjfCPO6DsxTN42anDJCJkVRvg/qndp/1wAHJX/WX3jDF
         oCFA==
X-Forwarded-Encrypted: i=1; AHgh+Rrw7/nLuRAWbMMcW1WMCNLHFbktyYZ9I5Z8SlJoRYa5VzN6zsqg3yFwsEmZbKAphzmgOk/88IscQBXf@lists.linux.dev
X-Gm-Message-State: AFuF++mktfOo2n6EYHoZJ1hl6sK5iK+Pyklb2EbWlkw7ppoVz5j4vxGO
	ufkDFdXcAbqkoTXkbfmOyTfCDeRq/6Y8SCJO6ifdt/YiJHrPoSnMHqoaqTY6otxaMIc7XTVZ0B7
	BMC7nMpbCcZc9ckrzabEKD/86ayplETquM8F+HP2PGA==
X-Gm-Gg: AR+sD11f4ll8rOVgRT28xMU+K/cDNABwip/yStW7LKHUz/vG8rfGp9mFcuaeQ4Kjm4e
	zFOBlBQNGQoqn9eFGoK7VcrWSkQLdKuS+ZwYDx2tFactG6wqygyo7KSLu2tZ29lTxldsmsAQfM5
	Dp1CVFu1S/YZIjLxgic6Y/0zSlzrEzaGhySxLssHcziq+kh/EP68NSQLp3npfIqoWlgVAauCaEv
	Dp4IM7SJddas/jsy/fbYdHEd4cc3RpZeZXdZzo1bncm+Uv7NgRgbms5/eXw3IF7kH3zdNYuzRDJ
	Fhd+MsVN4xaUhVG24cyNUvQLhBZiyXNMBb7lhRng2t0ApyYvzQAgAvm8zqQv6PluLklAsiSZ0FA
	UO7k=
X-Received: by 2002:a05:620a:5750:b0:916:10f6:780f with SMTP id
 af79cd13be357-9373953509amr1588246685a.27.1787577245733; Mon, 24 Aug 2026
 06:14:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260820123533.190470-1-jamz@amazon.com> <20260820123533.190470-2-jamz@amazon.com>
In-Reply-To: <20260820123533.190470-2-jamz@amazon.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 24 Aug 2026 15:13:54 +0200
X-Gm-Features: AcwNN1X0yMdB_Xw--2TlAcHWFEbPlDL4l3JW0OZo8vrZHgvCHyF1YZDBOHI7mRI
Message-ID: <CAJfpegtZQZ+c+Sz-tm144xKXuwLNTTOSHHbSWULwqQGkREMCHw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] fuse: zero the partial EOF page when extending a file
To: Jimmy Zuber <jamz@amazon.com>
Cc: shuah@kernel.org, fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, jack@suse.com, joannelkoong@gmail.com, 
	bfoster@redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Aug 2026 at 14:36, Jimmy Zuber <jamz@amazon.com> wrote:

> +void fuse_zero_partial_eof_folio(struct inode *inode, loff_t from, loff_t to)
> +{
> +       struct folio *folio;
> +       size_t offset, end;
> +
> +       if (from >= to)
> +               return;
> +
> +       folio = filemap_lock_folio(inode->i_mapping, from >> PAGE_SHIFT);

How about:
truncate_pagecache_range(inode, from, to - 1);
?

The mkclean/mark_dirty magic is only needed by filesystems using
buffer heads, as Jan pointed out.  The other parts of the zeroing are
done by the above helper.

Thanks,
Miklos
