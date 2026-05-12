Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75BD4C6EFF
	for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 10:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580065; cv=pass; b=UJF9jcHoFZs2AUIvsl1Ss0+f15HaQOpfdfcD9Y2AuAYBWS2HGNooCtvf3GfDvRE7GnAGkCpre9c4hnCWmoaO2Sgp3UJZ8Uvmtt8eRkwCxJnXHFAhZULBLitRCdCQ96NFg8k/eJ1QWYJTzVZ1prjE9rbG5fGtm6ITVPYIHJsLh98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580065; c=relaxed/simple;
	bh=OzmR2EceqZl8thCprtMqthW6BbEcxyp93xblOmmafPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MAonbsVY/Hr1rsCNjWKeLxtP4qIXbxDgmQIO1lV9UifCZd1CJF+ZgBBzCZ0ZYMxBZFGNqbwFV+RTEytQSTrDmtVkAvZidkkexutRdWUU9zq3C8C0zaCg/z3ZpEq2JnpbFfuA2xp+r4W3rYAXNNIAWnEB4cXcjx3ZrkjbIHxoE7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=XlMR4coL; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="XlMR4coL"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7bf02533706so48256377b3.0
        for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 03:01:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778580062; cv=none;
        d=google.com; s=arc-20240605;
        b=VpEYLW+UAXh7iYQDTZbObnQog98cLZD2nLSmPdvFf4BhLPub3NDd3ZwkgYlq3vKLqI
         0e+l+kh2lVvUkO/lCTrpO7OKnngnYVpJydTAz7eoH4P78HEVEs7bkeDLvZx9ja6T7F02
         G+lRKqsuHFgbhrZjuwoD+nG/BtpUKUOt/xevVYP1z40/j9VQGa31LBjGYgnq3gWlsLtS
         /khVbs4+Fiw98TzzJhA88CbeMm165IlXb0j62otK8VajFxfMcwIlFCHo0tNs022Vqpit
         JtEzvLcXc1Y0BQMu69J0L6KZyT58KuF/I8mOCGS6/yQrFK8oEwy0h1MruO4dVl8H/Bha
         vI3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+2cAANG65P6m/2dMkcD/5SXbjFJGHgOXwKiLtBmqwqU=;
        fh=+ilEkEn249oqMYCPiUMDSAe5002EfvBiI0vr+ICtgHc=;
        b=Aczi7YRzKLB3lveap1jnj1jl50pfofllDy4SuJw8i9ewAL7xZEBjP2UB8mW3as5niD
         jY2nDZ4s6T9svF8N1ETz2w4HQCA+eHlyDeYa8VjL5wqg9GiMSuLXgt2zGhM1C/qYlH0U
         q5apa6TllF94fgN9Do+B5vjoOQ+ZmLba6/HnIobpOT3khO6yNdAmzuOFV2Ffeb8fu+E+
         6jaIXqCYChRMLdFZdsw0/SSZdRqRvOfun2UYXog+NOvytm+L9GYIEvZv0shQ6XFDasfW
         kdnH8vLN+K+eDLvycUErjXHg9y7/PBCL2b28vKUs2asCTNCwDDD09bix1SuWrNddOqh/
         yR5A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1778580062; x=1779184862; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+2cAANG65P6m/2dMkcD/5SXbjFJGHgOXwKiLtBmqwqU=;
        b=XlMR4coLFc6HBjhTOBJfyAZhxHPriDimFEBYILivOQOrFQBAJp53pP1lqVgq7Tt9Oj
         V/PORn3G5DnG6zo9OWjsrRElu5BT+v9z10vgvXY1nGThcwD+Yht1Wmhouc6oXIByBYVl
         JXauHVfEKHMei5/yyaR2A4W/XixxsbOpp2LGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778580062; x=1779184862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2cAANG65P6m/2dMkcD/5SXbjFJGHgOXwKiLtBmqwqU=;
        b=ajSXsSeMjlFhuP8Mn26PbKXvxLJsodW3AQBXGsJeFlzNkMuOOmkLdPcdKozmh1VN1f
         4Zg+hTSdeGmJcAF7TtFf3QIFUnGABaAxPR/Zo4OK8x9DCzQsAh3vtnBevZU0IlIO5e/C
         oEWIE7NR7ehJncryJvgS8qtvlazLtZ7TxawK9imlfD3SpNjF5qIx9IiprPGvOJyUjgmN
         RUN1zr/N4jBgf84F1VZ+n0uAXCeGiYAfjOSY5jqZXMUCkuRdVtYTAje2kUMTbckPWI+R
         OK57cBXhGbS7DCWsMk/4RhJt4v20kC0E6N89+Q41dhNJS0KU/EF5G7sMa82zaEVpTR/F
         8plQ==
X-Forwarded-Encrypted: i=1; AFNElJ+KzL89OSYf8yGdKEqPHW0ezWewS8O97JHjqDGWOTztSgDHPjq1y2NpbH6y6f+czSd77XQsI26gt/pz@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6HZlsbPb0WPAOzRWGQAqj2HAIYFU4UFPfcdDaxcMMhkkbY9Rw
	tO/uKM80IcRAk5u56ic78cM5n7RnZt81RBNcVynJ02Sp6St1s+Mza0qn2yQfkRiLKuK3KggnrHL
	zCApE8uJPI8ihtQjBUyNhvB7AKauYi4vdTUgAdJeHqw==
X-Gm-Gg: Acq92OHakrWmSmkNuuRle36Lhh0MOgHhI9nL50KFCEIqU4vg+7yShdUNa3mVhpPOR0N
	zBNeXiHm3R1SquuPSIDvakR+IkgqQaMA9X81KnIFEDSCjuKMublcP+vfDRhP/Bst1oRNvmVsg6u
	MtEBmiJZFlzlzCz7G7A9arbzrOuZJAFS6Nyd9WrX/FfZAOa5YGkCVRFSQIVo2lWKhr45r81/34d
	neUPtr/q+6E+0WXTkw+RERyvD5x4zIRgJuszZL5VbSm4zvztieWJtGTv8jOecmzF8TB+nu6I09G
	hD7Ovvz8kBX9fEZtAZ343GRZECZed7Au3Ht2xvVq2YbY7hP8cQ==
X-Received: by 2002:a05:690c:e646:b0:7ba:f712:95f6 with SMTP id
 00721157ae682-7bdf5d99656mr202158237b3.3.1778580060567; Tue, 12 May 2026
 03:01:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJfpegvXnA1QpmfM9V+3VB470xYDNWH8FV0mBV1R1-HqvjfJ8A@mail.gmail.com>
 <CAOQ4uxhnOEkX4qnn0wHMCqWhEeAGTR9rxcw5u_oqGUovuszo0w@mail.gmail.com>
 <943cb464-78f3-44a7-92a7-57a1fe4fbc10@linux.alibaba.com> <CAOQ4uxh4yKEBdgbkfZTVyYM1P8ahALFVJzQCj7ASkrH746_4xw@mail.gmail.com>
In-Reply-To: <CAOQ4uxh4yKEBdgbkfZTVyYM1P8ahALFVJzQCj7ASkrH746_4xw@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 12 May 2026 12:00:49 +0200
X-Gm-Features: AVHnY4JolkvdzUP6hf73qCIiLjxOWc5d-oU24VC554xpuxQx6bkO6OQqR7vJugw
Message-ID: <CAJfpeguR=x+Kf7jd4zyeSoUtbjaPRLhXCRh9wa3c14x+M77kXA@mail.gmail.com>
Subject: Re: [post LSFMM summary] where is fuse going?
To: Amir Goldstein <amir73il@gmail.com>
Cc: Gao Xiang <hsiangkao@linux.alibaba.com>, fuse-devel <fuse-devel@lists.linux.dev>, 
	linux-fsdevel@vger.kernel.org, John Groves <John@groves.net>, 
	Joanne Koong <joannelkoong@gmail.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Bernd Schubert <bernd@bsbernd.com>, Horst Birthelmer <horst@birthelmer.de>, 
	Luis Henriques <luis@igalia.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 May 2026 at 09:53, Amir Goldstein <amir73il@gmail.com> wrote:

> The problem is only with  fuse_passthrough_mmap().
> Depending on the workload (?) mmap may not be important and
> we could fail if trying to map cross-backing-id regions.

mmap(2) is the main entry point into famfs,  so it's very important.

That doesn't work with "traditional" passthrough and needs to do the
DAX mapping that famfs currently does.

Thanks,
Miklos
