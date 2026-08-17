Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D89743A7F7
	for <fuse-devel@lists.linux.dev>; Mon, 17 Aug 2026 15:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786980737; cv=pass; b=JxYsAGPfPKgl/BDofLaKvsvFTriYJ5UHLrY4AUovB4Ncyj05Vpj4IIluq4VHtonhXdotzcPcAYkOgp8xhnZLn9YN2KOto1OTN5tGoFiVQAcnv52S5gtSSTAeUkOZ0QRfqiw2FcqHb04psdehmCTLw1wlEo1m7b9gJCQkhxmusoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786980737; c=relaxed/simple;
	bh=lzT1olTgOv1YQfp5BbGWVkpkMgGJ8dAmY5c+s6CocTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r8pMSh2IXqOcNJLpJpHdglF1KCSTAjK7UezHDczSdvvYd0umjfu5Eh9h31a5BrLiJca30hFeRmAcD0LhpIKAYNqGCOfst5hoBVLYCFrpGZV5zmsMrOyj6zQGGgYXV/4Hni4akZcj5lbcK/ezmG1DIIaRz8o+J7cBvF3yKfy2uYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=ePks/LeK; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="ePks/LeK"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c2a76536bso33964211cf.1
        for <fuse-devel@lists.linux.dev>; Mon, 17 Aug 2026 08:32:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786980735; cv=none;
        d=google.com; s=arc-20260327;
        b=RLi2zGREWfFaJSgbBywWa/IFMV7e8x5i4x/QVWynspyH3PC5OQqDFhbV3xdKCRfjWD
         c3Nf5Rn4MzAnm/5iuHaTvvRfxfqaHO12gAl3noM1esizn9Roi0Z2frVqLYqVGW6xHPFx
         FyldPo3/enWmv0eMo2JbW7I8lFyB0yZ7rsdkAKkqspdgFky19q13MUkJ5NpidgvUIbLd
         UN9VINF5UAjPNzJGcCL/VGoWT8b6kcErAsQ3pW/Rm09/k4mfKK17a04VDgLHrjQ8mgwE
         Bxp0EB9kEQ6Fl9FzKbUWthaLTDH9in+asT3d6UE3O1AQ/piBQxlOVWhVEYP8vyRMfUM/
         NkSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lzT1olTgOv1YQfp5BbGWVkpkMgGJ8dAmY5c+s6CocTM=;
        fh=1u+IZGQt5E52e2oqCbtQyqrb/BdfSip7HbqtW77krSo=;
        b=f2HI1BPBvifqPS3UHt4ypErmEJsrMK9RTtvWdWxyh3EBGxbdCyX+EU0UyQ1HCmyItk
         okmIskHt61ylm6zUGC1WLx8B0b22/O9Z7hIPZ6Cfe6ssodsluiKUNJZlaip6mxt2u+LT
         IvTXFtwEBaG40UfObh0rhJoESt+UdfmPH9e2E6rMEa2Qv05NifND/oZ4kHfL58+uP2Pw
         LQyoqhIuZC66x6taEzyaya5r1jmXmxiPnL/vRORQCccv8eoMi2jplum2lE1eZiCdFU0b
         jJzxITWsed/558KIRqxpTOhlbT/6zIM5jAJhpLh77ZrdiPrlsZmE/ylI3wKSZ/4OqyeI
         kggg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1786980735; x=1787585535; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lzT1olTgOv1YQfp5BbGWVkpkMgGJ8dAmY5c+s6CocTM=;
        b=ePks/LeKWX1bgOOQpHVAm/kOBNYTeu8IVfdrjVpD7keRjyq16waOk8bfGXL+ndOxe6
         LR2YnT0x87FbRB96MZsPFyOtEjeZ244GRZzLZ6AoNqBQNL9RkRQkOLsiKD+hMDNlDvQn
         Msgu/Ar8ceman8k4CACg7SLaozYhZKMKg3OgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786980735; x=1787585535;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lzT1olTgOv1YQfp5BbGWVkpkMgGJ8dAmY5c+s6CocTM=;
        b=ZfnFTciB1I64MD3rK4BUkRxCUfeC/HGV8/GBe4NM2RgvSCoI5IoF0bl3MN685MRPVs
         kelygCniezkZ6TROYuwbu6WWeJL43ysRtAUkQWp8vf/fXoW8cGSrnndsE/hwwdKcSkbX
         pGlc5HMsG4W7VtgwDw5aLQ0HoaxJowoZojuVmrm0vuvhW6aCMfjrI/c+SvNmqLJrtW2f
         LKGypjs+3RJJQVO4CaTNKnDLVStvEUvm5RBKTeaiSdUFhCE5LmFMvl/rgTzBZAzV8t2m
         oL53bUEOffs5qx1RN4DWnXJvZe4ozQ3Nwppb8B0x0kdBaB9GMZwOQifRLu1Khk999il6
         lGkA==
X-Gm-Message-State: AOJu0YxmHtm3pGtq0htO3VkQq7il1YO1A6f1IXK7SY7pTBkTriJ80mUP
	cjZjlsYUfBPDE94aQwlGDTA1Kd25WaGLDoXT+T43Ts1vZOxlsSsVwq1BUMDdeRAM3fOVg8hTj7Q
	HKux+2UQsNglDP88mCSb1fyXmeSHbSr7yKxBClmjvHw==
X-Gm-Gg: AR+sD11v6fbGAP8zbYnUJJgU/xMEQWe61oEu9C5AqmOA3ajTgP0Vo5LmXTlebf140HI
	hwHg7rf7l/OFaSq4zFbVuGwmMRRyKD1PCiSDiSLRG1ykYSfMZmlpDulJvPOGnsPRQlK+lUdAZeP
	SmU/K4mKSmM17J1AsPGHZ5NeI6SnUaF5LVuXBTiBUcky97YubIy5rfxv+28NKU4cutHlsgq5E/9
	q5dox7FuVeQI938AVlSBnI2FlLsAKGPZYSIKn2JwX/sy/Ly7HAT3ccdsNJNVabLi+l8hGqn/E85
	pCNRbTKW7PJ/6+F10o9YeQCWsgdeJ2FTAm+sxnRe6O6wIW/iDxao5hexCfKFubEo/LIlNhGohY2
	qNQUu+WuqFmw=
X-Received: by 2002:a05:622a:58cf:b0:517:9570:c1bd with SMTP id
 d75a77b69052e-52d854c2d90mr299291941cf.25.1786980734972; Mon, 17 Aug 2026
 08:32:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260623094206.678569-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20260623094206.678569-1-ben.dooks@codethink.co.uk>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 17 Aug 2026 17:32:03 +0200
X-Gm-Features: AcwNN1Us60nDbYsu0Sqt_ocQ_XHacRX4Eh2QKQheRbWYkFQvF1rocRvGbBb4Xuw
Message-ID: <CAJfpegu3Rf9dz-z1Oyou1zYGQ9zPA9akR8zjsJg=0eKWjAhi3A@mail.gmail.com>
Subject: Re: [PATCH] fuse: make dentry_tree_work static
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jun 2026 at 11:42, Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> The dentry_tree_work is not exported, so make it static
> to remove the followign sparse warning:
> fs/fuse/dir.c:37:21: warning: symbol 'dentry_tree_work' was not declared. Should it be static?
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Applied, thanks.

Miklos
