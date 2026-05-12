Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88996492199
	for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 08:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778574042; cv=pass; b=rjQwlypMRtFleMGVtzvL4Dhi/MEB+U67kU3Tjgz8qaVMBKPhUm8dDYnFpskvYu+z4nCpxYScBKn/GK0EdcA47q1LEwC9zB1pcskV8nXaPFrCEWmAe9h6KJ2CV1cXx5XgQWLBCx+YPxk855I3Qp8O5iqsNw4r4Ln+Xr77VJcrsgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778574042; c=relaxed/simple;
	bh=fKfMrHD8oyyXlFvPaUSx76chUJT+CgteFg5+VuswYao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uLwKMl0XNH/SJulUHhpeVKVHYZb6NG5CDkXSnIE2wH+4W+kQ5lrubowvtwAHFq7Jk3KyDLz48UGB/x6Ek5tyrbvplsKcHc7qPnPgkZqzy2eTkxKXbTfAyHRVRPFk8cYU+pONwExR5Y1hW4K70TWcKeqMcmWFSsS1XFOu1GqgrGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=UwJeniXp; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="UwJeniXp"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8b45dff1eebso50461566d6.2
        for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 01:20:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778574039; cv=none;
        d=google.com; s=arc-20240605;
        b=Lw6p2MnzUjIxFpYzhLnXYwlGFpVGA4d/+neRBOKRCZYeBy/l1+xj7W0gOdCjJN4VSv
         mSOZoLuYVPrLXJqov2xcK1ARy73sHQ3GNS+yU0OJRmzEHR0sa53vdJzjVuG7Ue5QUUdO
         cy1gdRT5oPDSD787+kpee1PEj9Z6EXUI53vZpwMJj+KI62myR6eO1iB/6OKbeoNYbYP/
         s+gG/9kzjSXUhFE+TmZwS3i3mVbRCbpA8jZFTh5VKrTyS8zUWbt9sqCB1oaVv9kR/fVq
         Xx6MQByvc5FRtOV+f0RnIFe8xnw9EcDmv11LtIsUhg0xFU8Nskr9GYukEFnHCIt2vzLO
         LHSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fKfMrHD8oyyXlFvPaUSx76chUJT+CgteFg5+VuswYao=;
        fh=mGURCq00hLz+R7+cKiNW2u7AvLc7FdTA3uju2hct0XE=;
        b=BR5PcPy0fRnS42XPG8UecnJpSokiN6s9uYntNe81reeggmd70/DmXFJIsZEDlci8cq
         aw6YUk/ssBha6CBrJk5gCn2KXUH7pVhxUAwk3Nn1KAB/yGFB+iAViEWty91igUhxlU3D
         FI2+33hchL3YwBI6djVNCN4FHtd3T0/dA6Xjh6ZnjGGFPuIid8ZfbSJ+j8S7NMDaK583
         EDtv88sGMJXBh96Dc8Ac0hDQcu8tzWUkeeauumA2KYCUSh6b7savPItZrv3QZp0F3gDN
         f23JO9UXyfc1OASJA92JaOGvgORah8R7VkHA1ZVZINEKk2XWKIXVwmzPgdlCTT03XTL3
         c7FQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1778574039; x=1779178839; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fKfMrHD8oyyXlFvPaUSx76chUJT+CgteFg5+VuswYao=;
        b=UwJeniXp/uVZNiZWcellpgT/Xuak/b0Er536TqSNbhA5e/fS2VXOqKk6awdtvcKJL6
         n+4J17swEN+7i4mg/ImC8gf0aoW1wNt81rtIcZPYh9OUrya7pCHX6l0f6oH6lIanHxDn
         4J9PrVHepLxtpi0EFctw84rNi9vlrVJkfcExs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778574039; x=1779178839;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fKfMrHD8oyyXlFvPaUSx76chUJT+CgteFg5+VuswYao=;
        b=mH3bYHpbdwbkthlyNstGEbuKv23/ImGBGJh+ujdZMuvljfsGNqQyL8e8WAYHIG+WHP
         hR6eLPdkqI9N+xcj7pVwnkE2firAPj0arxaSOuJNSioM9cij/hq6CJdpogXbHj+H6s9C
         npqAbs1EcKT0CiP/Ib7mSGPRMYD/o9DoJD0xwYJ7nJnT74cOO+Ne4L/CTkmsa0O7XSa/
         uzPbe5p8yVEMgU4O/QF9DDa/6Vgzt6cztZ2X6VvXyPaXOHOz16r1Zdm/misG5MZZ3c1M
         nDkMrKYGKT1MUG/ZaIIzO36Gt26FAa0B9Kbryub8uQ9MHG7zt6rlfgM66dri6/h7f6qp
         i9sQ==
X-Forwarded-Encrypted: i=1; AFNElJ+G2kpveGKTrugWDAhHsp+vtvwAmj72Q5luFHneglD92q4HFKtR2pGWLS1nr6tYUz8CuR95ZQVFyNpU@lists.linux.dev
X-Gm-Message-State: AOJu0YwSfCu40Bw1uONuz8wtxxA2K6rFH3o8LLLaVkzUjjcHSj4I2UeE
	HTU14p9M/kNhMq42+AYVvJLLH1pU+1tN65CLPGzHi1dMI2xhD01mjWz8PrL/EJZnCv7uSpJ2oRz
	pvK1v/jGkTcs7iMhbs+rd2CCLtbS2q5GJDprHzh45zA==
X-Gm-Gg: Acq92OFzEk7xZYkZH1Q6r+45HpaATi2wI9XFPc5vWULIFnVSsHq2YrFCQRkZEq1Ut0y
	dn1PA4Ze00n5sd5HYrhcO2vvEMorg+FHLbDbQCQe7BmbjS399jW/A1dfwQUK+9eAjhvC2crBmry
	8CmS8OKShT2Y5JO3w/nYwMHg9+4JhAiBXRVQf+LGmyEVM3OENQ7RjT/NcUb9to5RMNFl9tO3J90
	c4jIduXHMqHxW5JHRTbu+H+zI7NsGdIx3VONLz1s1oHMUQ5Z0+/3R+2CqRmGFfMnZwMbpcDtmJ7
	Dl+zDz/z/uwqWfLE5vAxpjKziAoy+jh+T4P4d0g=
X-Received: by 2002:a05:6214:5d8a:b0:8ac:8cbb:49bd with SMTP id
 6a1803df08f44-8c663f6e991mr29899726d6.38.1778574039379; Tue, 12 May 2026
 01:20:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260429102058.1362965-1-mszeredi@redhat.com> <af4clh11ik-DYbiF@fedora.fritz.box>
In-Reply-To: <af4clh11ik-DYbiF@fedora.fritz.box>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 12 May 2026 10:20:28 +0200
X-Gm-Features: AVHnY4I87giYMHcTP9Z_8zJeositYNIniBNdnAIidGjXDSBrpwLz792i0h3gDXw
Message-ID: <CAJfpegtFCjDdPqb0zbPczVBdJvU4n=coVftBqKNbsEPYMSbiHw@mail.gmail.com>
Subject: Re: [PATCH] fuse: add fusex filesystem
To: Horst Birthelmer <horst@birthelmer.de>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 May 2026 at 19:36, Horst Birthelmer <horst@birthelmer.de> wrote:
> I think you're missing
> #include <uapi/linux/magic.h>
> here for FUSE_SUPER_MAGIC

Okay.

Thanks,
Miklos
